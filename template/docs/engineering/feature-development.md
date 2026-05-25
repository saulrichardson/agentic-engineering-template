# Feature Development Guide

Use this guide before building meaningful features. The goal is to help coding
agents move from product intent to working software while preserving the core
idea.

Small features can answer these questions quickly. Large features can use
project records in `docs/records/` when they need durable planning context.

## 1. Name The Goal

Describe the outcome in product terms:

- who benefits?
- what should they be able to do?
- what existing pain or workflow changes?
- what visible result proves the feature exists?

## 2. Find Existing Context

Inspect:

- `docs/product-intent.md`
- `docs/project-profile.md`
- relevant project records
- nearby code
- existing tests
- schemas, migrations, configs, and deployment files
- current user or developer workflows

Let the repository teach the implementation shape.

## 3. Identify Domain Concepts

Name the concepts the feature introduces or changes:

- actors
- resources
- commands
- events
- states
- permissions
- external systems
- operational signals

Important concepts should become visible in code, tests, docs, or project
records.

## 4. Choose The Natural Home

Place behavior where future agents will expect it:

- UI state and interaction in the interface layer
- request parsing at the entry point
- business rules in domain/application code
- data facts in schemas and migrations
- permissions in policy or authorization code
- long-running work in workflows or workers
- external effects in integration boundaries
- observability in logs, metrics, traces, or audit events

## 5. Design The First Useful Slice

Prefer a working vertical slice:

```text
intent -> entry point -> domain behavior -> durable result -> visible feedback
```

The first slice should be narrow enough to verify and real enough to teach the
next step.

## 6. Define Data And State

Ask:

- what durable facts are created or changed?
- what states exist?
- what events move between states?
- what constraints should the database or schema enforce?
- what migration or alignment path exists for current data?

Add a project record when lifecycle behavior becomes shared or important.

## 7. Define Authority

Ask:

- who can perform the action?
- what context affects the decision?
- what ownership or tenant boundary applies?
- what audit or review event should exist?

Add a project record when policy becomes shared across modules, services, or
workflows.

## 8. Define Side Effects

Ask:

- what external systems are touched?
- what happens after partial failure?
- what can be retried?
- what should be idempotent?
- what timeout or failure state is useful?

Represent important side-effect behavior in code, tests, workflow events,
telemetry, deployment notes, or a project record when future agents need the
decision.

## 9. Define Observability

Ask:

- what event proves the feature happened?
- what identifier connects user action, data change, and side effect?
- what logs or metrics help operate it?
- what audit event helps reconstruct important behavior?

Add a project record for shared event names or operating signals.

## 10. Verify And Ship

Choose checks that prove the feature:

- unit or domain tests for rules
- integration tests for boundaries
- migration checks for data
- UI or browser checks for user flows
- workflow or worker tests for retries and failure paths
- build and deploy checks for release readiness

Then update docs or project records where future agents need the decision.
