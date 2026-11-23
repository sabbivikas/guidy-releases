
- Updating Guidy now happens entirely inside Guidy. When a new version is ready, the pill at the top of your screen says "Update", and Guidy's panel shows what's new with an Update Guidy button.
- One click: you see it download, then install, and Guidy reopens by itself on the new version and says "Updated". No Finder, no disk image, nothing to drag.
- "Later" hides it until Guidy next opens, and it never interrupts a lesson. If an update ever fixes something important, Guidy says so plainly and asks you to update before your next question.
- "Guidy home" is now the Lessons tab in Guidy's panel, next to Settings and Account: your finished lessons with Replay, without a separate window.
- Opened Guidy from an old installer disk image by mistake? It now switches to the Guidy in your Applications folder, and puts away old Guidy disk images left open.

Developer notes: GuidyUpdateController is Sparkle's user driver (SPUUpdater + SPUUserDriver); Sparkle shows no window. Checks at launch, every 4h and when the panel opens (15 min throttle); downloads only on click. The app sends X-Guidy-Build; the Worker's MIN_SUPPORTED_BUILD (empty) can require an update with 426 app_too_old. release.sh gains --critical / --critical-below, and --build-only no longer refuses a tag that is up as a pre-release. The search for other copies no longer reads ~/Downloads or ~/Desktop (macOS asked for folder access).
