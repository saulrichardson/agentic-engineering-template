# System Contracts

System contracts are durable notes for behavior that other code, agents,
workflows, tools, policies, or operators depend on.

Use these files when a behavior becomes shared, risky, operationally important,
or easy for future agents to misread.

## Contract Files

- `state-machines.md`: lifecycle states, events, guards, terminal states, and
  transition ownership
- `tool-registry.md`: external integrations and side-effect capabilities
- `workflow-events.md`: durable workflow events, retries, idempotency, and
  failure behavior
- `policy-inputs.md`: policy inputs, authority dimensions, decisions, and audit
  events
- `telemetry-events.md`: traces, metrics, logs, audit events, and correlation
  identifiers

## When To Add A Contract

Add or update a contract when:

- several modules depend on the same behavior
- a state change needs a clear lifecycle
- an integration mutates external systems
- a workflow crosses process or time boundaries
- a permission decision affects user trust or data access
- an operational event helps reconstruct production behavior

Contracts should be short and useful. They give future agents enough structure
to make confident changes.
