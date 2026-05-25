# Feature Brief: <feature name>

- status: draft
- owner: <name or role>
- date: YYYY-MM-DD

## Goal

As a <user or actor>, I want to <intent>, so that <outcome>.

## Context

- relevant docs:
- relevant code:
- relevant ADRs:
- examples:

## Product Behavior

What should happen?

- <behavior>

## Domain Concepts

- <domain object>
- <domain object>

## First-Class Change

Does this feature introduce a new durable concept, authority boundary, state,
event, data flow, side effect, command, or deployment behavior?

If yes:

- where is it represented first-class?
- what existing abstraction changes?
- what contracts or docs change?
- what tests prove the new model?

## State And Events

States:

- <state>

Events:

- <event>

Rejected or unavailable transitions:

- <transition>

## Authority

- authenticated actor:
- user permissions:
- ownership or tenant boundary:
- coordination or approval:

## Persistence

Durable facts:

- <fact>

Constraints:

- <constraint>

Audit records:

- <audit event>

## Side Effects And Integrations

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

## Verification

- <test, command, property, or manual check>

## Deployment Notes

- config:
- migrations:
- rollout:
- rollback or mitigation:
