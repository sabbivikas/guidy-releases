
- Paid on the website and Guidy still said "no plan yet"? Fixed. Restore now finds your plan from the email you paid with, even if you paid more than once or used a promo code, and Guidy unlocks by itself a few seconds after you pay.
- The Account tab shows Subscribe and Restore side by side, and which email this Mac is signed in with.
- Setup no longer gets stuck at "2 of 4": Guidy checks Screen Recording by actually trying it, and when macOS needs Guidy to reopen, the row says "Restart Guidy" and one click does it.
- Opened Guidy from the download? It now offers to move itself into Applications, where macOS keeps what you allow.
- "Other copies of Guidy are in the way" now lists each copy with where it is and its version, and one button moves the old ones to the Trash. A newer copy is never called old.
- Right-click Guidy in the menu bar to see its version and build, check for updates, or save a debug log if setup gets stuck.
- The download window now shows plainly: drag Guidy into Applications.
- The top of your screen stays clean: Guidy's pill is hidden until you move the pointer to the top centre, and it also shows while Guidy is listening, thinking or talking.

Developer notes: the Worker asks Stripe live (all customers for an email, filtered to GUIDY_PRODUCT_ID) on /auth/start, /auth/verify and on /billing/status when it stored no plan; links checkouts without client_reference_id by email; 3-day grace; 5 codes per install per hour. release.sh requires create-dmg and runs scripts/verify-release-dmg.sh.
