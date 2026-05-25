# Project Records

Use this directory for durable project knowledge.

Project records are the one standard way to document decisions, caveats,
technical choices, constraints, risks, learned guidance, invariants, operating
notes, and feature context that future agents should inherit.

Create a record when the information is useful beyond the current task. Use a
short filename that starts with the date:

```text
YYYY-MM-DD-short-topic.md
```

Examples:

```text
2026-01-15-frontend-stack.md
2026-01-20-report-export-caveats.md
2026-02-03-billing-state-model.md
2026-02-10-production-deploy-notes.md
```

## Record Shape

```markdown
# <record title>

- date: YYYY-MM-DD
- status: draft | active | superseded
- kind: decision | caveat | stack | feature | invariant | risk | operation | learning
- owner: <person, team, or agent>

## Context

What prompted this record?

What facts from the project matter?

## Guidance

What should future agents know, choose, preserve, migrate, or revisit?

## Evidence

What code, tests, commands, examples, production signals, user feedback, or
constraints support this record?

## Consequences

What changes because of this record?

## Follow-Up

- <task, question, or owner>
```

## How To Use Records

Use records for anything durable:

- chosen technical stack and why
- caveats discovered during implementation
- meaningful product or domain decisions
- policy, permission, ownership, or tenant assumptions
- state, workflow, data, or telemetry guidance
- security or abuse-risk notes
- deployment or operating model notes
- lessons learned that should change future agent behavior

Keep records direct. A record should help the next agent make a better decision
without reading chat history.
