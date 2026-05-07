# Feature Brief: <feature name>

- status: draft
- owner: <name or role>
- date: YYYY-MM-DD

## User Intent

As a <user or actor>, I want to <intent>, so that <outcome>.

The system must not allow:

- <unsafe or invalid behavior>

## Domain Concepts

- <domain object>
- <domain object>

## State And Events

States:

- <state>

Events:

- <event>

Invalid transitions:

- <transition that must be rejected>

## Authority

- authenticated actor:
- user permissions:
- agent delegation:
- tool capabilities:
- approval required:

## Persistence

Durable facts:

- <fact>

Constraints:

- <constraint>

Audit records:

- <audit event>

## LLM Boundary

- input type:
- output type:
- allowed variants:
- validation:
- fallback/refusal:

## Tools And Side Effects

- side effect:
- policy check:
- idempotency:
- retry behavior:
- failure state:

## Observability

Correlation IDs:

- <id>

Logs/traces/audit events:

- <event>

## Tests

- <invariant or behavior to prove>

## Deployment Notes

- config:
- migrations:
- rollout:
- rollback or mitigation:
