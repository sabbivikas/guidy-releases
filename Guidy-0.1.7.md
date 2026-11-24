
- Better answers to "how do I… in this app?": Guidy now knows which app and which website you're in, and checks its steps against that product's current help pages (30 popular apps and sites to start).
- Guidy points at the real button on your screen, not a guess from the picture.
- If an app has moved or renamed a button since Guidy learned it, Guidy notices the button isn't on your screen, checks the current help pages and gives you the up-to-date steps.
- If a step doesn't work, or you say "that didn't work", Guidy tries a different way instead of repeating itself, or gives you the official guide.
- If the button is just scrolled out of sight, Guidy shows you which way to scroll.

Developer notes: model first. Replies open with a hidden [ROUTE:] tag; RouteCheck checks the first control against the window's accessibility tree and speech waits for it. A missing control, a failed [EXPECT:] or "didn't work" re-asks with the Worker's web lookup on (guidy_grounding.lookup). Verified looked-up routes go to POST /answers, kept only when every label is on the docs page. DEBUG screen test set (ScreenTestSet.swift). Build 13.
