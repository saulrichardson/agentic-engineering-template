# System Map

This map describes how work moves from goal to shipped behavior. It covers
development-time work done by autonomous coding agents and ordinary runtime
behavior inside the product.

## Coding-Agent Delivery Path

Coding-agent work should follow this path:

```text
goal
  -> repository context
  -> working theory
  -> implementation choice
  -> code and documentation change
  -> tests or checks
  -> delivery notes
  -> ADR or profile update when useful
```

This path keeps autonomous work tied to outcome and evidence. The exact amount
of process scales with blast radius.

## Product Behavior Path

Every meaningful feature should be understood across the product path:

```text
user intent
  -> interface or entry point
  -> application command
  -> domain behavior
  -> policy or permission decision
  -> durable data
  -> workflow or background work when useful
  -> external side effect when useful
  -> observable result
  -> deployment path
```

Developer tooling follows the same pattern:

```text
developer goal
  -> command or script
  -> project state change
  -> verification output
  -> documented usage
```

## Common Project Objects

Serious systems often benefit from first-class objects like:

- `UserIntent`
- `Command`
- `DomainEvent`
- `StateTransition`
- `PolicyDecision`
- `WorkflowRun`
- `SideEffect`
- `AuditEvent`
- `IdempotencyKey`
- `Deployment`
- `HealthCheck`

These names are examples. The principle is that meaningful concepts should be
visible in code and data.

## Layer Responsibilities

### Interface

The interface captures user or developer intent and represents system state. It
guides the actor and translates actions into commands.

### Entry Point

An entry point can be an API handler, CLI command, job, webhook, worker, or UI
action. It parses input, authenticates when needed, and calls the application or
domain layer.

### Domain Model

The domain model defines the meaningful facts, objects, rules, and transitions.
Important product rules should have a stable home here.

### Policy

Policy answers what an actor, service, workflow, or tool may do. It should be
explicit enough to test and operate.

### State And Persistence

Important lifecycle changes should pass through clear transition logic. The
database or durable store records facts the product relies on and enforces
constraints where practical.

### Workflow

Workflows coordinate long-running, retryable, externally dependent, or
human-coordinated work. They make waiting, retries, compensation, and final
state visible.

### Side-Effect Capability

A side-effect capability mutates the world outside the current process:
external API, email, file write, payment, command execution, cloud mutation,
queue publish, or notification.

Shared side-effect capabilities should have clear inputs, outputs, owner,
timeout, idempotency behavior, and observability.

### Observability

Telemetry reconstructs behavior across tasks, requests, workflows, policy
decisions, side effects, database changes, deployments, tests, and audit events.

## Redesign Signals

Use these signals to consider a clearer design:

- a coding agent needs unrelated files to understand one behavior
- the same rule appears in several layers
- lifecycle status changes from many places
- side effects happen with unclear retry or failure behavior
- authorization logic differs by entry point
- migrations change ownership or invariants with missing durable explanation
- workflow state is hard to resume or explain after failure
- production behavior is difficult to reconstruct from records and telemetry
- deployment steps live only in memory or chat history
