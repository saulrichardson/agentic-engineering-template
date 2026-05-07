# System Map

This map describes how work moves from intent to durable consequence. It covers
both development-time work done by autonomous coding agents and runtime behavior
inside the application.

## Coding-Agent Development Path

Coding-agent work should follow this path:

```text
task intent
  -> repository context
  -> change classification
  -> design boundary
  -> implementation plan
  -> code change
  -> tests / verification
  -> review evidence
  -> documentation / ADR if needed
  -> deployability check
```

This path prevents agents from optimizing only for local code changes or passing
tests. A change is not complete until its boundary, risk, verification, and
review evidence are clear.

## General Runtime Path

Every feature should be understood across the full stack:

```text
user intent
  -> frontend state
  -> API boundary
  -> domain model
  -> policy / authorization
  -> state transition
  -> durable persistence
  -> workflow orchestration
  -> external side effects
  -> observability
  -> deployment / infrastructure
```

No LLM is required for this path to matter. Ordinary profile updates, billing
jobs, admin tools, reporting workflows, and infrastructure changes all need
explicit boundaries.

## Runtime-Agent Path

When the product itself contains an LLM or runtime agent, use this specialized
path:

```text
user intent
  -> typed intent object
  -> runtime agent proposes plan
  -> plan is parsed into typed command candidates
  -> policy checks authority
  -> state machine checks validity
  -> approval is requested when required
  -> workflow executes durable steps
  -> database records state change
  -> outbox or tool gateway performs side effects
  -> telemetry records the full trace
```

The runtime agent proposes. Deterministic software decides and executes.

## Common Domain Objects

Serious systems often need first-class objects like:

- `UserIntent`
- `StateTransition`
- `PolicyDecision`
- `WorkflowRun`
- `SideEffect`
- `AuditEvent`
- `IdempotencyKey`
- `ApprovalRequest`

Runtime-agent systems may also need:

- `AgentRun`
- `AgentPlan`
- `LLMCall`
- `RetrievedContext`
- `ToolProposal`
- `ToolInvocation`
- `ApprovalDecision`

These names are examples, not mandatory types. The principle is that meaningful
concepts should be visible in the code and data model.

## Layer Responsibilities

### Frontend

The frontend captures user intent and represents system state. It may guide the
user and prevent obvious mistakes, but it is not trusted for security,
authorization, pricing, workflow validity, or final business decisions.

### API Boundary

The API boundary authenticates the actor, validates request shape, turns input
into typed commands, and calls the application/domain layer. API handlers should
be thin.

### Domain Model

The domain model defines the meaningful facts, objects, rules, and transitions.
Business rules should live here, not in prompts, UI conditionals, migrations, or
route handlers.

### Policy

Policy answers what an actor, service, workflow, coding agent, runtime agent, or
tool may do. It should be explicit, testable, and separate from prompt text.

### State Transition

Important lifecycle changes should pass through transition functions or services
that check guards, enforce invariants, and produce auditable events.

### Persistence

The database records durable truth and enforces durable invariants with
constraints wherever practical.

### Workflow

Durable workflows coordinate long-running and retryable work. They should make
waiting, retries, compensation, approval, and final state visible.

### Side-Effect Capability

A side-effect capability is any controlled way to mutate the world: external
API, email, file write, payment, command execution, cloud mutation, queue
publish, or runtime-agent tool.

Side-effect capabilities should be narrow, typed, policy-checked, timed out,
idempotent where possible, and auditable.

### Observability

Telemetry reconstructs behavior across tasks, requests, workflows, model calls,
policy decisions, side effects, database changes, tests, deployments, and audit
events.

## Design Smells

- a coding agent changes behavior without classifying risk
- a generated change crosses a boundary without tests or review evidence
- a route handler owns complex business rules
- a lifecycle status is assigned from many places
- a side effect happens before a durable event is recorded
- authorization differs between frontend and backend
- a database migration changes ownership or invariants without an ADR
- a workflow cannot be resumed or explained after a crash
- a runtime LLM can directly mutate state
- a runtime tool accepts arbitrary SQL, shell, URL, or email content
- retrieval can access data outside the user or tenant scope
- production incidents cannot be reconstructed from durable records and traces
