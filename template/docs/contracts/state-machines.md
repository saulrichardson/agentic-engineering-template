# State Machine Contracts

Use this file to record important lifecycles. Do not let important statuses
become strings assigned from arbitrary code.

## Required Fields

For each state machine, record:

- owner module
- states
- events
- valid transitions
- invalid transitions
- guards
- terminal states
- audit events
- retry or cancellation behavior

## Agent Run Reference

This is a reference shape. Rename or replace it when the project defines its
real domain objects.

States:

- `created`
- `context_gathering`
- `planning`
- `awaiting_approval`
- `executing`
- `waiting_external_result`
- `completed`
- `failed`
- `cancelled`

Events:

- `UserIntentAccepted`
- `ContextGathered`
- `PlanProposed`
- `ApprovalRequested`
- `ApprovalGranted`
- `ApprovalDenied`
- `ToolInvocationStarted`
- `ToolInvocationSucceeded`
- `ToolInvocationFailed`
- `ExternalResultReceived`
- `AgentRunCompleted`
- `AgentRunFailed`
- `AgentRunCancelled`

Rules:

- no tool may execute directly from `planning`
- approval-required actions must pass through `awaiting_approval`
- terminal states are `completed`, `failed`, and `cancelled`
- duplicate events must not create duplicate side effects

## Tool Invocation Reference

States:

- `proposed`
- `policy_checked`
- `approval_required`
- `approved`
- `executing`
- `succeeded`
- `failed`
- `rejected`
- `compensated`

Rules:

- `proposed` cannot move to `executing` without policy check
- approval-required tools cannot move to `executing` without approval
- `succeeded`, `rejected`, and `compensated` are terminal unless an ADR says otherwise

## Project State Machines

Add project-specific state machines below.
