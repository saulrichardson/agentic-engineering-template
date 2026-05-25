# Project Approach

Project: <project name>

<project description>

This file is the current project truth.

Use it to understand how the project is shaped today: the selected stack, the
architecture, the operating model, the constraints that matter, and the way work
is verified and delivered.

Use `product-intent.md` for the product north star. Use `records/` for durable
rationale, caveats, lessons, and dated decisions.

## Project At A Glance

- domain:
- main users:
- main workflows:
- current stage:

## Stack

- frontend:
- backend:
- data store:
- auth or policy model:
- background work or workflow runtime:
- hosting or deployment target:
- build command:
- test command:
- deploy command:

When the stack changes, update this section for the current truth. Add a record
when future agents should understand why the choice was made.

## Architecture

Describe the current system shape at the level future agents need to act.

- main applications or services:
- important directories:
- where product rules live:
- where state and durable data live:
- where integrations and side effects live:
- where deployment and operations live:

## Operating Model

Describe how the main workflows move through the system.

```text
intent
  -> interface or entry point
  -> product behavior
  -> state or durable data
  -> side effects
  -> observable result
  -> delivery or operation
```

Keep this section focused on the project-level model. Feature details belong in
code, tests, and records when the reasoning should persist.

## Constraints And Invariants

Document the facts that shape future work.

- durable source of truth:
- important entities or resources:
- states or lifecycles that matter:
- rules that must remain true:
- sensitive data or ownership boundaries:
- actions that need coordination:
- high-blast-radius or irreversible actions:

## Verification And Delivery

- expected local checks:
- expected manual checks:
- migration or data checks:
- deployment path:
- smoke checks or operational signals:
- rollback or mitigation path:

## Open Questions

- <question>

## Related Records

List records that explain why the current approach exists or what future agents
should remember.

- `records/YYYY-MM-DD-short-topic.md`
