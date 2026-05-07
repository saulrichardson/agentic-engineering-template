# Engineering Doctrine

We build cloud-hosted agentic applications that remain understandable, safe,
auditable, and correct as they grow.

The core rule:

```text
LLMs may propose actions.
Only typed, verified, policy-checked, durable workflows may execute actions.
```

An LLM is a nondeterministic reasoning component. The rest of the system treats
it as an untrusted planner whose outputs must be parsed, validated, authorized,
recorded, and executed by deterministic infrastructure.

## What We Are Preventing

Large systems usually fail because meaning becomes scattered.

Business rules drift into route handlers, prompts, UI conditionals, webhook
handlers, background jobs, admin panels, and helper functions. State changes
happen from many places. Side effects happen before durable state is recorded.
Authorization is checked inconsistently. Retries duplicate effects. Production
failures cannot be reconstructed.

This doctrine exists to keep meaning centralized and behavior explainable.

## First Principles

- Make state explicit.
- Make events explicit.
- Make transitions explicit.
- Make permissions explicit.
- Make side effects explicit.
- Make durable facts constrained.
- Make workflows recoverable.
- Make LLM outputs typed and validated.
- Make production behavior observable.
- Make builds and deployments reproducible.

These principles matter more than any specific framework.

## Authority Model

The system distinguishes:

- authentication: who is the actor?
- authorization: what may the actor do?
- delegation: what may an agent do for the actor?
- capability: what exact tool or data access is available now?
- approval: does this action require human confirmation?

Agents, users, workflows, and tools may have different authority boundaries.
Prompts do not define authority.

## State Model

Important lifecycles should be modeled as state machines.

State should change through events and transition functions, not arbitrary status
assignment.

Example:

```text
current state + event + facts + policy = next state or rejection
```

If a lifecycle matters to correctness, safety, policy, auditability, or user
trust, it deserves explicit states and transitions.

## Side Effect Model

Side effects include database writes, LLM calls, emails, uploads, external API
calls, payments, tool execution, queue publishes, notifications, and cloud
resource changes.

The preferred sequence is:

```text
decide
persist the decision
record the event
execute side effects through a workflow or outbox
observe the result
```

Side effects should be visible, bounded, policy-checked, retryable where
possible, idempotent where practical, and auditable.

## LLM Model

LLM output is data, not authority.

An LLM may return a typed object such as:

- summary
- classification
- extraction
- draft
- plan proposal
- tool proposal
- clarifying question
- refusal

It must not directly execute unchecked mutations. Every LLM boundary needs a
schema, validation, policy check, audit record, model/version trace, and failure
path.

## Tool Model

Tools are how agentic systems touch the world. They must be narrow, typed,
capability-scoped, and auditable.

Avoid broad agent-facing tools:

- `run_sql`
- `execute_shell`
- `http_request`
- `send_any_email`
- `write_any_file`

Prefer narrow tools:

- `searchAuthorizedDocuments`
- `createDraftEmail`
- `submitApprovedTicket`
- `lookupOrderStatus`
- `scheduleApprovedCalendarEvent`

Tool outputs are untrusted input. A webpage, document, or API response may try
to influence the agent. Tool results cannot override system policy.

## Database Model

The database is the durable source of truth.

Use database constraints for durable invariants:

- foreign keys
- unique constraints
- non-null constraints
- check constraints
- constrained status values
- idempotency keys
- audit/event tables
- ownership relationships

If something must always be true, ask whether the database can enforce it.

## Workflow Model

Long-running, failure-prone, multi-step work belongs in durable workflows.

Use workflows for processes such as:

- agent run execution
- approval flows
- tool execution
- document ingestion
- retrieval indexing
- external API orchestration
- scheduled agent operations
- human-in-the-loop work

A worker crash should not erase the business process.

## Observability Model

Every important action should be reconstructable.

The system should be able to answer:

- what did the user request?
- what did the agent infer?
- what context was retrieved?
- what did the LLM return?
- what policy was evaluated?
- what tool was proposed?
- was approval required?
- what action executed?
- what state changed?
- what side effect occurred?
- what failed or retried?

Use structured logs, traces, metrics, audit events, and stable correlation IDs.
Do not leak secrets or private data into telemetry.

## Final Test

For any significant design, future maintainers should be able to understand:

- what state exists
- how it can change
- who can change it
- what effects happen
- what was recorded
- what can be retried
- what can be audited
- what can fail

If those answers are unclear, the design is drifting.
