
- Guidy now tells you, before it asks for anything, what it sees and where it goes.
- Each thing you allow has a plain reason beside it, and a "Reopen Guidy" button for the one that needs it.
- Leaving your email is optional.
- Guidy no longer opens at login unless you turn that on.
- New under More: share anonymous usage numbers (on or off), delete my Guidy data (everything Guidy keeps on this Mac, after a second click), check for updates.
- Homework stays yours: Guidy gives the next hint instead of the answer.
- The panel now explains the two other ways to ask: hold Control to type, or circle something with the mouse.
- When something goes wrong, Guidy says what: no internet, nothing heard, or today's limit reached.
- A lesson that pauses now says so out loud.
- If you switch to another app in the middle of a lesson, Guidy waits and points the way back.
- A lesson keeps going when a drop-down or a sheet opens, and on a screen that never holds still.
- Guidy finds a slider or switch by the words beside it, so a lesson can finish on one.
- Pointing at Wi-Fi and other menu bar icons lands on the icon itself.
- Fixed a crash caused by the lesson progress strip.

- Add a one-command demo preflight for the pinned commit, proxy setup, Chrome, duplicate processes, and power.

- Make releases fail closed unless the Sparkle feed push succeeds and the new version is publicly visible.

- Start the Sparkle updater in release builds so installed copies receive published updates.

- Replace the old plain cursor app icon with the approved blue Guidy character face.

Since 1.0:

- **Guidy Home is real**: warm reskin with the buddy front and center, and a
  wins board backed by the actual walkthrough log - every card replays what
  it taught. New users see just the buddy and the hotkey line.
- **Learn mode**: "teach me X" explains the plan first with an on-screen
  flow diagram, waits for a ready, then walks it with a progress strip.
  Quick asks still get quick answers - intent routing keeps them apart.
- **Day-part greeting v2**: a fresh kaomoji face and line every day
  (weekday/season/festival aware), triggered by laptop wake/unlock, plus a
  9-11pm bedtime wind-down. Clean pill, no buttons. The buddy wears a sleepy
  face - droopy lids, slow yawn - while the late-night greeting is up.
- **Circle to explain, with the flight**: circle anything with the mouse and
  the buddy arcs over, loops once around your circle in the direction you
  traced, parks at the top while the ring ripples, then explains what you
  circled out loud. The ring gets a "got it" caption and stays up a beat
  longer.
- **Home window reliability**: joins the active Space, floats above
  fullscreen apps, re-presents onto the cursor's screen, size hard-pinned.
- **Fixes**: walkthrough closing line said once, interrupted replies no
  longer speak an error voice, teach requests that drew nothing now route
  and draw, home-board replays keep their plan.
- **Tests + CI**: reply-parser unit tests and an app-launch smoke test run
  on every PR.
- **Docs**: prompt eval set (docs/prompt-evals.md), payments decision
  record (PAYMENTS.md), AI Magic night demo runbook (docs/demo-runbook.md),
  payments spec (docs/payments-spec.md).
