# System Map

Use this file to decide where a change belongs.

## The Question

Before editing, ask:

```text
Where should this behavior live so the next agent can find it?
```

The answer should guide the files you change, the tests you run, and the docs or
deployment notes you leave behind.

## Product Path

For product behavior:

```text
user intent
  -> interface
  -> entry point
  -> domain behavior
  -> data/state
  -> side effects
  -> observable result
  -> deployment
```

For developer tooling:

```text
developer goal
  -> command or script
  -> project state change
  -> verification output
  -> documented usage
```

## Placement Guide

- Interface: display, interaction, accessibility, client state, local feedback
- Entry point: request parsing, CLI args, webhook intake, job trigger, routing
- Domain: product rules, state changes, calculations, core decisions
- Persistence: durable facts, migrations, constraints, data ownership
- Workflow: background work, retries, scheduling, coordination, compensation
- Policy: permissions, ownership, tenant boundaries, approvals
- Side effects: external APIs, files, queues, notifications, cloud changes
- Observability: logs, metrics, traces, audit events, health checks
- Deployment: config, secrets, build, rollout, rollback, smoke checks
- Documentation: project facts, feature intent, decisions, operating notes

## Redesign Signals

Use these signals to consider a clearer design:

- a rule appears in several places
- behavior is hard to test without unrelated setup
- data changes happen without a clear owner
- side effects have unclear retry or failure behavior
- errors are swallowed or only visible in logs
- deployment steps live only in memory or chat history
- a future agent would need chat history to understand the change
