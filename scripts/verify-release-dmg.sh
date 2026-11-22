#!/bin/bash
#
# verify-release-dmg.sh - refuses a Guidy DMG that is not what its tag says.
#
#   scripts/verify-release-dmg.sh <path/to/Guidy.dmg> <tag, e.g. v0.1.4> [<build number>]
#
# Mounts the disk image read-only and checks:
#   - Guidy.app is inside, with CFBundleShortVersionString equal to the tag
#     (without its "v") and, when given, CFBundleVersion equal to the build;
#   - the drag-to-Applications layout: an Applications shortcut and a
#     background picture, so nobody opens Guidy from the disk image;
#   - the app has the notch panel (GuidyIslandWindowController), so an old
#     build cannot go out under a new tag.
# Exits 1 and says what is wrong on any mismatch. Used by scripts/release.sh
# before anything is published, and by the guidy-releases repository's
# verify-release workflow on every published release.

set -euo pipefail

DMG_PATH="${1:?usage: verify-release-dmg.sh <dmg> <tag> [build]}"
TAG="${2:?usage: verify-release-dmg.sh <dmg> <tag> [build]}"
EXPECTED_BUILD="${3:-}"
EXPECTED_VERSION="${TAG#v}"

MOUNT_POINT=$(mktemp -d)
cleanup() { hdiutil detach "${MOUNT_POINT}" -quiet >/dev/null 2>&1 || true; rmdir "${MOUNT_POINT}" 2>/dev/null || true; }
trap cleanup EXIT

if ! hdiutil attach -nobrowse -readonly -noverify -mountpoint "${MOUNT_POINT}" "${DMG_PATH}" >/dev/null; then
    echo "❌ ${DMG_PATH}: could not be mounted"
    exit 1
fi

APP_INFO_PLIST="${MOUNT_POINT}/Guidy.app/Contents/Info.plist"
if [ ! -f "${APP_INFO_PLIST}" ]; then
    echo "❌ ${DMG_PATH}: no Guidy.app inside"
    exit 1
fi

FOUND_VERSION=$(/usr/libexec/PlistBuddy -c "Print :CFBundleShortVersionString" "${APP_INFO_PLIST}")
FOUND_BUILD=$(/usr/libexec/PlistBuddy -c "Print :CFBundleVersion" "${APP_INFO_PLIST}")
FAILED=0

if [ "${FOUND_VERSION}" != "${EXPECTED_VERSION}" ]; then
    echo "❌ ${DMG_PATH}: Guidy.app is version ${FOUND_VERSION}, but the tag is ${TAG}"
    FAILED=1
fi
if [ -n "${EXPECTED_BUILD}" ] && [ "${FOUND_BUILD}" != "${EXPECTED_BUILD}" ]; then
    echo "❌ ${DMG_PATH}: Guidy.app is build ${FOUND_BUILD}, expected ${EXPECTED_BUILD}"
    FAILED=1
fi
if [ ! -L "${MOUNT_POINT}/Applications" ]; then
    echo "❌ ${DMG_PATH}: no Applications shortcut to drag Guidy onto"
    FAILED=1
fi
if ! ls "${MOUNT_POINT}/.background/"* >/dev/null 2>&1; then
    echo "❌ ${DMG_PATH}: no background picture (the plain fallback layout was used)"
    FAILED=1
fi
# grep reads everything (no -q): with pipefail, -q stopping early would make
# strings fail with SIGPIPE and the match would read as a miss.
if ! strings -a "${MOUNT_POINT}/Guidy.app/Contents/MacOS/Guidy" | grep "GuidyIslandWindowController" >/dev/null; then
    echo "❌ ${DMG_PATH}: this build has no notch panel (GuidyIslandWindowController): an old build?"
    FAILED=1
fi

if [ "${FAILED}" -ne 0 ]; then
    exit 1
fi
echo "✅ ${DMG_PATH}: Guidy ${FOUND_VERSION} (build ${FOUND_BUILD}) matches ${TAG}, with the drag-to-Applications layout and the notch panel"
