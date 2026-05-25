# Definition Of Done

Done means the goal is satisfied and the project has enough evidence to trust
the result.

Use this definition with judgment. A typo fix needs little ceremony. A schema,
security, deployment, or public behavior change needs stronger proof.

## Core Completion Criteria

A change is done when:

- the requested outcome works in the current repository
- the implementation fits the surrounding code and project profile
- relevant tests, builds, checks, or inspections have been run
- docs or ADRs are updated when future agents need the context
- deployment, migration, or operational consequences are known
- the final report states what changed and how it was verified

## Behavior

For behavior changes, confirm:

- the main success path works
- important edge cases are handled
- errors are explicit and useful
- public interfaces match callers or documented contracts
- state and data changes are represented in the natural system layer

## Verification

Verification can include:

- automated tests
- type checks
- lint or format checks
- build commands
- migration dry runs
- local browser or CLI smoke checks
- manual inspection of generated output
- logs, traces, or screenshots
- small reproducible examples

The best verification exercises the path that matters to the task.

## Documentation

Update documentation when the change creates durable knowledge:

- new product behavior
- new command or workflow
- new dependency or stack choice
- new data shape or migration rule
- new deployment requirement
- new security or operational assumption
- new decision future agents may question

Keep docs concise and close to the decision.

## Delivery

For deployment-facing changes, include:

- build command
- test command
- required environment variables
- migration or data step
- deploy command or pipeline
- smoke check
- rollback or mitigation path

When credentials or production access are required, record the exact handoff and
the evidence already gathered.
