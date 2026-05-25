# Deployment Readiness

Deployment is part of engineering. Use this guide when a change affects release,
runtime configuration, infrastructure, data, background work, or operations.

## Release Shape

Describe:

- what is being released
- which users, services, or workflows are affected
- which environment receives it first
- how success will be observed
- how the team returns to a stable state if needed

## Build And Test

Record the commands:

- install dependencies:
- format or lint:
- type check:
- unit tests:
- integration tests:
- build:
- smoke test:

Run the commands available in the local environment and capture blockers for the
remaining ones.

## Configuration And Secrets

List:

- required environment variables
- secret names and owners
- config files
- feature flags
- service accounts
- external endpoints

Confirm that local, staging, and production expectations are visible to future
agents.

## Data And Migrations

For data changes, record:

- migration command
- expected data volume
- backfill or cleanup step
- compatibility expectation
- rollback or mitigation path
- verification query or check

## Infrastructure

For infrastructure changes, record:

- provider or platform
- plan/diff command
- apply/deploy command
- state storage
- permissions needed
- rollback or replacement path
- owner for follow-up operations

## Observability

Before release, identify:

- logs to inspect
- metrics to watch
- traces or audit events to query
- health check or smoke test
- alert that should fire on failure

## Handoff

A deployment-facing final report should include:

- what changed
- what was verified
- what command deploys it
- what config or secrets are required
- what migration or data step exists
- what smoke check confirms success
- what rollback or mitigation path exists
