# Sailing Logbook Template (Typst)

A customizable, A4-ready sailing logbook for printing and binding. It features a technical log on left-hand pages and a journal/notes space on right-hand pages. Watch schedules and emergency cards are generated automatically from the variables you provide.

## Dumb Usage :P

If you don't want to touch any code or Git:
1. **Download:** Grab the `logbook.pdf` from this repository.
2. **Print:** Print it out on A4 paper.
3. **Pen & Paper:** Fill in the cover page, crew lists, and watch schedules by hand.

## Private Tracking Workflow

Use this method to keep your private cruise data (crew lists, locations) in a private repository while pulling layout improvements from this public template.

1. **Create a private repository** on GitHub for your personal logs.
2. **Add this template as a remote:**
   ```bash
   git remote add template https://github.com/nd-dew/sailing-logbook.git
   ```
3. **Manage cruises as branches:** Create a new branch for each trip (e.g., `git checkout -b blue-ward-2026`).
4. **Pull layout updates:** When the public template is improved, pull those changes into your private cruise branch:
   ```bash
   git pull --rebase template master
   ```
   This updates the layout while keeping your private configuration variables at the top of the file intact.

## Roadmap

---
*Belgian Sailing Community*
