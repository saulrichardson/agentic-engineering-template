# State Machine Contracts

Use this file for important lifecycle behavior.

State machines help agents understand which states exist, which events move
between them, and which rules protect the transition.

## Registry

| Machine | Entity | States | Events | Owner | Tests |
| --- | --- | --- | --- | --- | --- |
| Example invitation lifecycle | `Invitation` | `pending`, `accepted`, `expired`, `revoked` | `InviteSent`, `InviteAccepted`, `InviteExpired`, `InviteRevoked` | domain service | transition tests |

## Core Details

For each lifecycle, record:

- entity or aggregate
- allowed states
- allowed events
- transition owner
- guards or permissions
- terminal states
- retry or idempotency behavior
- persistence representation
- tests that prove the important transitions

## Transition Shape

Useful transition shape:

```text
current state + event + facts + policy = next state or rejection
```

## Implementation Notes

Keep lifecycle changes easy to find. A transition function, domain service, or
workflow step should own each important state change.
