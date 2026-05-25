# Workflow Event Contracts

Use this file for durable workflow events.

Workflow events help agents understand long-running work, retries,
compensation, human coordination, and externally dependent steps.

## Registry

| Workflow | Event | Payload | Idempotency key | Success behavior | Failure behavior |
| --- | --- | --- | --- | --- | --- |
| `InvitationWorkflow` | `InvitationCreated` | invitation id, team id, email | invitation id | enqueue notification | mark notification pending |
| `InvitationWorkflow` | `InvitationEmailSent` | invitation id, provider id | invitation id + provider id | mark sent | retry or surface failure |
| `BillingSyncWorkflow` | `CustomerSynced` | customer id, version | customer id + version | record sync point | retry with backoff |

## Core Fields

For each event, record:

- workflow name
- event name
- payload shape
- idempotency key
- retry behavior
- timeout or deadline
- success behavior
- failure behavior
- emitted telemetry or audit event

## Guidance

Workflow history should explain what happened after a worker crash, retry,
external outage, or manual intervention.
