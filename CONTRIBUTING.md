# Contributing

Thanks for helping improve eng-team. This is an unofficial community project.

## Layout

- `skills/eng-team/SKILL.md`: the Manager playbook.
- `agents/*.md`: Designer, Developer and QA subagent definitions.
- `examples/config.example.md`: documented optional config.
- `.claude-plugin/`: plugin and marketplace manifests.
- `scripts/`: manual installers (`install.sh`, `install.ps1`).

## Ground rules

- English only in all project files. No personal names, emails, paths or account details.
- Keep safe defaults safe: anything that commits, pushes, deploys, deletes or spends money must stay opt-in via config and must never be enabled by default.
- Keep skill and agent files consistent: if you change a rule in `SKILL.md`, check the agent files do not contradict it.
- Do not hard-code model names outside the configurable tiers.

## Before opening a PR

1. Run `claude plugin validate .` from the repo root and fix errors.
2. If you touched the installers, test them against a temporary target directory, never your real `~/.claude`: `bash scripts/install.sh "$(mktemp -d)"` and `install.ps1 -TargetDir <temp>`. Verify that a second run refuses without the force flag.
3. Try a small end-to-end task with the plugin installed and note what you saw.
4. Update `CHANGELOG.md` and, for user-visible changes, `README.md`.

## Reporting issues

Include your install method (plugin or manual), the agent types listed by `/agents`, your `.eng-team/config.md` (remove anything private), and what the Manager reported.

## Wording and discoverability

Write descriptions in plain, accurate words that people actually search for (for example "engineering team", "Claude Code", "subagents"). Do not stuff keywords, do not make claims the code does not back up, and do not imply affiliation with Anthropic or other projects. Keep the "unofficial community project" note.
