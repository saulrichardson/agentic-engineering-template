# Feature Development Guide

Use this guide before building meaningful features. The goal is to keep feature
work connected to the whole system without creating heavyweight process.

## 1. Define User Intent

Write the user intent in one or two sentences:

```text
As a <user or actor>, I want to <intent>, so that <outcome>.
```

Then state what the system must not allow.

## 2. Name The Domain Concepts

Identify the domain objects involved. Prefer meaningful names:

- `ToolProposal`
- `ApprovalRequest`
- `DocumentIngestionRun`
- `PolicyDecision`
- `AgentRun`
- `RetrievedContext`

Avoid generic names when the concept matters:

- `payload`
- `data`
- `metadata`
- `result`
- `status`

Generic fields can exist, but they should not hide the system vocabulary.

## 3. Identify State And Events

For each lifecycle, define:

- states
- events
- valid transitions
- invalid transitions
- terminal states
- retry behavior
- cancellation behavior

Use the smallest state machine that explains the behavior.

## 4. Define Authority

Answer:

- who is authenticated?
- what is the user allowed to do?
- what may the agent do on the user's behalf?
- what capability does each tool expose?
- what requires approval?
- what is denied by default?

Policy should be testable outside prompt text.

## 5. Define Persistence

Identify durable facts and constraints:

- primary records
- ownership or tenant scope
- foreign keys
- uniqueness rules
- check constraints
- idempotency keys
- audit events
- outbox events

If a fact must survive retries, crashes, or worker restarts, it belongs in
durable storage or workflow history.

## 6. Define Side Effects

List each side effect:

- LLM call
- tool call
- email
- file write
- external API call
- notification
- payment
- queue publish
- cloud resource change

For each one, define:

- policy check
- timeout
- retry behavior
- idempotency key
- audit record
- failure state
- compensation if needed

## 7. Define LLM Boundaries

If an LLM is involved, define:

- input schema
- output schema
- allowed output variants
- validation behavior
- refusal or fallback behavior
- model/version trace
- retention rules
- prompt-injection handling

The feature should work safely when the LLM returns malformed, incomplete, or
overconfident output.

## 8. Define Observability

Every important action should carry correlation IDs such as:

- request id
- user id
- tenant id
- agent run id
- workflow id
- LLM call id
- tool proposal id
- tool invocation id
- approval id
- audit event id

Log enough structured data to reconstruct behavior without leaking secrets or
private content.

## 9. Define Tests

Test the invariants, not just examples:

- unauthorized access is rejected
- invalid transitions are rejected
- duplicate events do not duplicate effects
- malformed LLM output is rejected safely
- retrieval respects permissions
- high-risk actions require approval
- workflow retries preserve correctness
- database constraints reject impossible facts

## 10. Ship The Smallest Safe Slice

Prefer a thin vertical slice over disconnected layers:

```text
UI intent -> typed API -> domain transition -> durable record -> observable result
```

Then widen only where the feature needs it.
