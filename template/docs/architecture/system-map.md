# System Map

This map describes the intended flow from user intent to durable consequence.
It is reusable across projects and should guide code organization.

## Canonical Flow

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

Every meaningful feature should know where it sits in this flow.

## Pure Agentic Flow

```text
user intent
  -> typed intent object
  -> LLM proposes plan
  -> plan is parsed into typed command candidates
  -> policy checks authority
  -> state machine checks validity
  -> workflow executes durable steps
  -> database records state change
  -> outbox or tool gateway performs side effects
  -> telemetry records the full trace
```

The LLM proposes. The system decides and executes.

## Common Domain Objects

Agentic systems often need first-class objects like:

- `UserIntent`
- `AgentRun`
- `AgentPlan`
- `ToolProposal`
- `ToolInvocation`
- `ApprovalRequest`
- `ApprovalDecision`
- `PolicyDecision`
- `WorkflowRun`
- `LLMCall`
- `RetrievedContext`
- `StateTransition`
- `SideEffect`
- `AuditEvent`

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
Business rules should live here, not in prompts or route handlers.

### Policy

Policy answers what an actor, agent, workflow, or tool may do. It should be
explicit, testable, and separate from prompt text.

### State Transition

Important lifecycle changes should pass through transition functions or services
that check guards, enforce invariants, and produce auditable events.

### Persistence

The database records durable truth and enforces durable invariants with
constraints wherever practical.

### Workflow

Durable workflows coordinate long-running and retryable work. They should make
waiting, retries, compensation, approval, and final state visible.

### Tool Gateway

The tool gateway is the controlled side-effect boundary. It exposes narrow
capabilities, checks policy, applies timeouts, records audit data, and treats
tool outputs as untrusted input.

### Observability

Telemetry reconstructs behavior across requests, workflows, LLM calls, policy
decisions, tool calls, database changes, and side effects.

## Design Smells

- an LLM can directly mutate state
- a route handler owns complex business rules
- a lifecycle status is assigned from many places
- a tool accepts arbitrary SQL, shell, URL, or email content from an agent
- a side effect happens before a durable event is recorded
- authorization differs between frontend and backend
- retrieval can access data outside the user or tenant scope
- a workflow cannot be resumed or explained after a crash
- production incidents cannot be reconstructed from durable records and traces
