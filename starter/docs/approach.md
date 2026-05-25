# Project Approach

Project: <project name>

<project description>

This file is the current project truth.

Use it to understand what the project is, who it serves, how it is shaped, what
stack it uses, what constraints matter, and how coding agents should extend it.

Use `docs/product-intent.md` for the product north star and user goals. Use
`docs/records/` for durable rationale, dated decisions, caveats, and lessons.

## Project Summary

- domain: <primary domain>
- primary users:
- core jobs:
- current product stage:

## Product Direction

Summarize the current product goal in a few lines. Keep the fuller evolving
north star, desired outcomes, examples, and user intent in
`docs/product-intent.md`.

## Current Stack

- frontend: <frontend choice>
- backend domain core: <backend or domain language>
- workflow runtime: <workflow runtime>
- durable database: <database>
- policy or authorization model: <policy or authorization model>
- cloud or deployment target: <cloud or deployment target>
- build command:
- test command:
- deploy command:

These are current project choices. When the stack changes, update this file for
the current truth and add a project record when future agents need the reasoning.

## Operating Model

Describe how work moves through the system today.

```text
user or developer intent
  -> interface or entry point
  -> product behavior
  -> data or state
  -> side effects
  -> observable result
  -> delivery or operation
```

Use this section for the project-level model, not for every feature detail.

## Architecture And Ownership

Describe the current system shape at a level future agents can act on.

- main applications or services:
- important directories:
- ownership boundaries:
- where product rules live:
- where durable data and migrations live:
- where workflows or background work live:
- where integrations and side effects live:
- where deployment and operations live:

## Data, State, And Invariants

- durable source of truth:
- key entities or resources:
- important states:
- critical invariants:
- migration or data-change approach:

## Security, Ownership, And Policy

- user, account, or tenant boundary:
- ownership model:
- sensitive data:
- authorization approach:
- audit or review expectations:

## External Systems And Side Effects

| System | Purpose | Data shared | Side effects | Owner |
| --- | --- | --- | --- | --- |
|  |  |  |  |  |

## Constraints And Non-Goals

- project constraints:
- explicit non-goals:
- actions that require coordination:
- high-blast-radius or irreversible actions:

## Verification And Delivery

- expected local checks:
- expected manual checks:
- migration or data checks:
- deployment or smoke checks:
- operational signals:

## Open Questions

- What is the first user-facing or developer-facing workflow?
- What data is the durable source of truth?
- What actions deserve explicit coordination?
- What external systems can the application touch?
- What should be observable from day one?

## Related Records

Link records that explain why the current approach was chosen or what caveats
future agents should remember.

- `docs/records/YYYY-MM-DD-topic.md`
