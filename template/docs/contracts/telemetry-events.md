# Telemetry And Audit Event Contracts

Use this file for events needed to understand production behavior.

Telemetry should help future agents, operators, and reviewers reconstruct what
happened while respecting private data and reducing reliance on memory.

## Event Types

- trace span
- metric
- structured log
- audit event
- deployment event
- health check

## Common Correlation IDs

- request id
- actor id
- tenant id
- resource id
- workflow id
- deployment id
- idempotency key

## Registry

| Event | Type | Core fields | Sensitive fields | Purpose |
| --- | --- | --- | --- | --- |
| `team_invitation_created` | audit | actor id, team id, invitation id | email address | reconstruct invitation lifecycle |
| `workflow_step_failed` | log | workflow id, step, reason, retry count | payload contents | operate background work |
| `deployment_completed` | audit | deployment id, version, environment, actor | secret values | reconstruct release history |

## Guidance

Prefer stable event names and structured fields. Record enough context to connect
user intent, data changes, workflows, side effects, and deployment behavior.
