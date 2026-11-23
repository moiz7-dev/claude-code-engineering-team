# eng-team config (optional)
<!-- Copy this file to .eng-team/config.md in your project. Every key is optional; a missing key uses its default. -->

language: English            # language of messages to you; default = the language you write in
tone: plain                  # plain (non-technical) | technical

models.default: sonnet       # every team member
models.cheap: haiku          # trivial tasks only
models.advisor: opus         # optional senior advisor; remove this line for no advisor
advisor: on                  # on | off

# Safe defaults: everything below is false unless you turn it on.
permissions.commit: false
permissions.push: false
permissions.deploy: false
permissions.db_writes: false
permissions.auto_confirm_forms: false

strict_order: false          # true enables the "strict order" rule
max_concurrent_agents: 6
