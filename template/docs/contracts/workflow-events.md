# Workflow Event Contracts

Durable workflows should expose meaningful events. These event names are part of
the system contract because retries, idempotency, telemetry, and support tools
depend on them.

## Required Fields

For each workflow event, record:

- workflow name
- event name
- payload type
- idempotency key
- retry behavior
- side effects triggered
- audit or telemetry event
- failure states

## Reference Workflow Events

| Workflow | Event | Payload | Idempotency key | Side effect | Failure behavior |
| --- | --- | --- | --- | --- | --- |
| `AgentRunWorkflow` | `UserIntentAccepted` | `UserIntent` | intent id | create run | reject duplicate |
| `AgentRunWorkflow` | `PlanProposed` | `PlanProposal` | llm call id | none | reject malformed |
| `AgentRunWorkflow` | `ToolProposalRecorded` | `ToolProposal` | proposal id | none | reject unauthorized |
| `AgentRunWorkflow` | `ToolInvocationSucceeded` | `ToolResult` | invocation id | record result | retry-safe |

## Rules

- workflows should record decisions before side effects
- external callbacks need idempotency keys
- retries must not produce duplicate side effects
- approval waiting states must be visible
- cancellation behavior must be explicit
