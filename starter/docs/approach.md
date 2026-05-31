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

Describe how the product turns intent into completed value.

```text
intent
  -> context or input
  -> work performed
  -> verification
  -> delivery or action
  -> observable outcome
  -> durable state, memory, or record
```

Keep this section focused on the product-level model. Do not describe only
screens, endpoints, tools, or implementation steps unless those are the actual
product model.

If the product requires a broad work environment, describe the kinds of access
or execution surfaces it needs. Avoid turning that environment into an
exhaustive tool list too early.

## Capability Boundaries

Document what the system is intended to do directly, what it prepares for a
human or external system, and what is out of scope.

- direct execution:
- generated or staged work:
- human-reviewed work:
- external-system handoff:
- intentionally unsupported work:

When safety, approval, cost, security, or reversibility matters, describe the
boundary without shrinking the intended capability.

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
