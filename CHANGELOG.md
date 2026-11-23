# Changelog

## 1.0.0 - 2026

Initial public release.

- Manager skill (`eng-team`) with kickoff, ticketing, QA gating and per-ticket reporting.
- Designer, Developer and QA subagents.
- Optional `.eng-team/config.md` (language, tone, model tiers, advisor, permissions); safe defaults ask before commits, pushes, deploys and destructive actions.
- Plugin and marketplace manifests; manual installers for Windows (PowerShell) and macOS/Linux (bash).
- Install check so the Manager uses `eng-team:`-prefixed agent names for plugin installs and bare names for manual installs.
