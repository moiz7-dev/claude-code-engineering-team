# Changelog

## Unreleased

- Added a social preview banner (`docs/social-preview.png`, source `docs/social-preview.html`).
- Added a plugin icon (`docs/icon.png`, `docs/icon.svg`) and wired it in `plugin.json`.
- README: banner under the title and an illustrative "Example run" image.

## 1.0.1 - 2026-11-23

- README: key strengths section and the low-cost motive.
- SEO and discoverability improvements (title, intro, FAQ, descriptions, keywords).
- Line-ending fix via `.gitattributes`.
- Added `llms.txt`, `SECURITY.md` and an issue template.

## 1.0.0 - 2026

Initial public release.

- Manager skill (`eng-team`) with kickoff, ticketing, QA gating and per-ticket reporting.
- Designer, Developer and QA subagents.
- Optional `.eng-team/config.md` (language, tone, model tiers, advisor, permissions); safe defaults ask before commits, pushes, deploys and destructive actions.
- Plugin and marketplace manifests; manual installers for Windows (PowerShell) and macOS/Linux (bash).
- Install check so the Manager uses `eng-team:`-prefixed agent names for plugin installs and bare names for manual installs.
