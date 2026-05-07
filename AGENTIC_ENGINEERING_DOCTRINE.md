# Agentic Engineering Doctrine

This is a single-file reader artifact assembled from the reusable agentic engineering template.

It is meant to be passed to someone who needs one coherent artifact rather than a repository tree.

Generated from the current template repository contents.

Template repository: https://github.com/saulrichardson/agentic-engineering-template

Reference rendering notes:

- Project name: Reference Project
- Primary domain: Reusable agentic software
- Cloud target: Undecided
- The generated project sections use reference values where project-specific answers are required.
- Technical setup and Copier mechanics are intentionally placed at the end.


---

## Pedagogical Overview

_Source: `README.md`, before `## Template Mechanics`._

# Agentic Engineering Template

This repository is a reusable pedagogical documentation template for building
high-purity agentic software.

It is not an application framework. It does not scaffold a frontend, backend,
database, cloud account, or agent runtime. It gives each new project a shared
engineering doctrine, a vocabulary, a set of first-principles design questions,
and a small set of project-local documents that make future technical decisions
easier to reason about.

The purpose is to make every project start with the same core discipline:

```text
LLMs may propose actions.
Only typed, verified, policy-checked, durable workflows may execute actions.
```

## Why This Exists

Agentic applications fail in a different way than ordinary CRUD applications.
They do not only have users, screens, routes, database rows, background jobs, and
external APIs. They also have nondeterministic reasoning components that can
summarize, plan, classify, extract, retrieve context, and propose tool calls.

That capability is useful, but it creates a purity problem.

An LLM is not a trusted program. It is a probabilistic reasoning component whose
outputs may be incomplete, overconfident, manipulated by retrieved text, or
inconsistent across runs. If the rest of the system treats model output as
authority, the application becomes a chatbot that mutates the world.

This template teaches a different architecture:

```text
user intent
  -> typed input
  -> LLM proposal
  -> schema validation
  -> policy decision
  -> state transition
  -> durable workflow
  -> constrained side effect
  -> audit and telemetry
```

The LLM contributes reasoning. Deterministic software decides what is valid,
authorized, durable, retryable, observable, and safe to execute.

## What This Template Teaches

The generated documentation is meant to train both humans and coding agents to
think in terms of boundaries rather than isolated tasks.

A feature is not just a UI change, an endpoint, a prompt, or a database table.
A feature is a path from user intent to durable consequence:

```text
user intent
frontend state
API boundary
domain model
policy / authorization
state transition
durable persistence
workflow orchestration
external side effects
observability
deployment / infrastructure
```

The generated docs repeatedly bring work back to that path. This is deliberate.
The most common failure mode in growing systems is that meaning becomes
scattered. Business rules drift into route handlers, prompts, frontend
conditionals, webhook handlers, background jobs, admin scripts, and migrations.
State changes happen from many places. Side effects happen before durable state
is recorded. Authorization is checked inconsistently. Retries duplicate work.
Production incidents cannot be reconstructed.

This template pushes against that drift by making the important questions
visible from the start:

- What user intent is being served?
- What domain objects are involved?
- What states can those objects be in?
- What events may change those states?
- Who is allowed to perform the action?
- What may an agent do on a user's behalf?
- What side effects can happen?
- What must be persisted before execution?
- What can be retried?
- What requires approval?
- What must be observable later?

## The Core Mental Model

The generated project docs are organized around one mental model:

```text
nondeterministic reasoning inside deterministic boundaries
```

That means:

- prompts do not define authority
- frontend checks do not define security
- LLM outputs are data, not commands
- tools are narrow capabilities, not broad execution channels
- state transitions are explicit, not scattered string assignments
- workflows own long-running and retryable side effects
- the database enforces durable facts where possible
- policy is testable outside prompt text
- telemetry records enough to reconstruct important behavior

The model is intentionally technology-independent. The default stack profile
favors Elm, Haskell, Dafny, Temporal, PostgreSQL, OPA, Wasmtime, Nix, and
OpenTelemetry because those tools fit the boundary model well. But the doctrine
is not the stack. The doctrine is the discipline that every replacement must
preserve.

The stack can change. The boundary should not.

## How A Project Should Use The Generated Docs

Each generated project gets local files. They are not submodules and they are
not read-only doctrine from elsewhere. The project owns them.

That ownership matters. A project should be able to say:

```text
This is the shared doctrine we started from.
This is our local project profile.
These are the decisions we changed through ADRs.
This is the first vertical slice we are building.
These are the constraints that matter in this domain.
```

Generated projects should use the docs in this order:

1. `AGENTS.md`
2. `docs/project-profile.md`
3. `docs/engineering/doctrine.md`
4. `docs/architecture/system-map.md`
5. `docs/architecture/stack-profile.md`
6. `docs/engineering/feature-development.md`
7. Relevant ADRs in `docs/adr/`
8. Relevant templates in `docs/templates/`

`AGENTS.md` is the root operating guide for future coding agents.
`docs/project-profile.md` is where the project records its local facts,
constraints, stack choices, and deviations. ADRs are where the project records
decisions that future agents might otherwise accidentally undo.

## What Gets Generated

A generated project receives the complete doctrine set:

```text
AGENTS.md
README.md
.copier-answers.yml
.gitignore
docs/
  README.md
  project-profile.md
  engineering/
    doctrine.md
    feature-development.md
    deployment-readiness.md
    formal-methods.md
  architecture/
    system-map.md
    stack-profile.md
  adr/
    README.md
    0001-adopt-agentic-engineering-doctrine.md
  templates/
    adr.md
    feature-brief.md
    agent-task.md
scripts/
  doctor.sh
```

The complete doctrine is generated into every project. Projects can ignore,
adapt, or override sections locally, but the starting point stays consistent.
That is simpler than asking each new project to decide which pieces of the
philosophy it wants before it understands its own shape.

## Why Copier Instead Of Submodules

This template is meant to be copied, customized, and updated deliberately.

Submodules are a poor default for that job. A submodule keeps projects pointing
at a separate repository, which is useful for shared code or centrally pinned
specifications. But these docs should become local project artifacts. They need
to be edited, refined, and contradicted by project-specific ADRs when reality
requires it.

Copier gives the right ownership model:

- generated projects get real local files
- each project answers its own stack and domain questions
- `.copier-answers.yml` records the template source, version, and answers
- future template improvements can be pulled with `copier update`
- local project decisions remain visible in normal Git diffs

In short:

```text
template repo = reusable teaching source
generated project = local truth
```

## How To Evolve The Doctrine

Changes to this template should improve the reusable teaching layer, not encode
one project's accidental implementation details.

Good template changes include:

- clearer first-principles explanations
- better feature planning questions
- better ADR prompts
- sharper policy, workflow, or tool-boundary guidance
- improved generated project profile structure
- corrections to the default stack profile
- small validation improvements in `doctor.sh`

Poor template changes include:

- scaffolding a specific app before a real project needs it
- adding project-specific business terminology to reusable docs
- hard-coding a cloud provider as an architectural truth
- hiding important decisions in prompts or scripts
- making the template mechanically clever when plain docs would work

When a project needs a different structure, it should usually record that in its
own `docs/project-profile.md` or ADRs. Promote the change back into this
template only when it is broadly reusable.



---

## Generated Project Operating Guide

_Source: `generated-project/AGENTS.md`_

# Agent Operating Guide

Project: Reference Project

This file is the root operating guide for coding agents working in this
repository. It is generated from the reusable agentic engineering template, then
owned by this project.

Project-specific decisions override the base doctrine only when they are
recorded in `docs/project-profile.md` or an ADR under `docs/adr/`.

## North Star

Build systems that safely contain nondeterministic intelligence inside
deterministic software boundaries.

```text
LLMs may propose actions.
Only typed, verified, policy-checked, durable workflows may execute actions.
```

LLMs may interpret, propose, summarize, classify, and plan. They do not directly
mutate the world. Any action that changes durable state or reaches an external
system must pass through typed validation, policy, state transition rules,
durable workflow execution, persistence, and observability.

## Read Order

Before substantial work, read these files:

1. `AGENTS.md`
2. `docs/project-profile.md`
3. `docs/engineering/doctrine.md`
4. `docs/architecture/system-map.md`
5. `docs/architecture/stack-profile.md`
6. The relevant feature brief, ADR, or local module documentation

If the repository has implementation code, inspect the code before changing it.
Do not assume the docs are more current than the source.

## Project Stack Defaults

- frontend: Elm
- backend domain core: Haskell
- workflow runtime: Temporal
- durable database: PostgreSQL
- vector storage: PostgreSQL + pgvector
- policy engine: OPA / Rego
- cloud target: Undecided
- formal methods: Dafny for critical modules; TLA+ or Lean when deeper
  specification is justified

These choices are defaults, not dogma. If the project substitutes a technology,
the replacement must preserve the same boundary: typed inputs, explicit
authority, durable state, recoverable workflows, constrained side effects, and
observable execution.

## Operating Model

For every feature or fix, locate the work on this path:

```text
user intent
frontend state
API boundary
domain model
policy / authorization
state transition
durable persistence
workflow orchestration
external side effects
observability
deployment / infrastructure
```

Most defects are caused by skipping or scattering one of these layers.

## Non-Negotiable Boundaries

- LLM output is data, not authority.
- User input is useful, not automatically valid.
- Frontend checks improve experience, not security.
- Policy lives in code or policy files, not only prompts.
- State changes go through explicit transitions.
- Side effects are durable, idempotent where possible, and auditable.
- External documents, tool results, and retrieved context are untrusted input.
- Secrets are never exposed to prompts, client code, logs, or broad tools.
- Production behavior must be reconstructable from traces, logs, audit events,
  workflow history, and durable records.

## Preferred Shape Of Code

Prefer:

- typed request and response boundaries
- small API handlers that call application/domain services
- pure domain functions for business rules and state transitions
- explicit state machines for important lifecycles
- narrow capability-scoped tools
- database constraints for durable invariants
- durable workflows for long-running or retryable processes
- structured telemetry with stable correlation IDs
- ADRs for architectural choices that future agents might question

Avoid:

- broad tools such as `run_sql`, `execute_shell`, `http_request`, or
  `send_any_email` as agent-facing capabilities
- lifecycle statuses assigned directly from many files
- business rules hidden in prompts, UI conditionals, migrations, or route
  handlers
- untyped blobs named `payload`, `metadata`, or `data` when the concept has
  domain meaning
- side effects before durable decisions are recorded
- introducing infrastructure that does not preserve the system boundaries

## Feature Work Checklist

Before implementing, answer the smallest useful version of these questions:

1. What user intent is served?
2. What domain objects are involved?
3. What lifecycle or state machine changes?
4. What permissions, delegation, capability, or approval checks are required?
5. What durable facts and database constraints are needed?
6. What side effects occur, and are they retryable or idempotent?
7. Is a durable workflow required?
8. Is an LLM involved, and what typed output may it return?
9. Are tools involved, and what narrow capability do they expose?
10. What telemetry and audit records are needed to reconstruct behavior?
11. What tests prove the important invariant?

Small changes do not require long documents. They still require clear answers.

## LLM And Tool Rules

LLM responses should map to explicit types such as:

- `AnswerDraft`
- `ClarifyingQuestion`
- `PlanProposal`
- `ToolProposal`
- `Classification`
- `Extraction`
- `Summary`
- `Refusal`

Tool proposals must be parsed, validated, policy checked, state checked, and
recorded before execution. High-risk actions require approval.

Good tools are narrow:

- `searchAuthorizedDocuments`
- `createDraftEmail`
- `lookupOrderStatus`
- `submitApprovedTicket`
- `scheduleApprovedCalendarEvent`

Broad tools may exist for internal operations, migrations, or local development,
but they should not be exposed as agent capabilities without a written decision.

## Testing And Verification

Tests should focus on behavior and invariants:

- pure domain logic
- state transitions
- authorization and delegation
- database constraints
- idempotency and duplicate delivery
- workflow retry and compensation behavior
- LLM schema parsing and refusal paths
- tool gateway allow/deny behavior
- retrieval authorization
- critical end-to-end flows

When changing production behavior, run the narrowest verification that proves the
change and broaden only when the blast radius requires it.

## Documentation Discipline

Documentation should clarify decisions, not freeze implementation details too
early. Use:

- `docs/project-profile.md` for local project facts and deviations
- `docs/engineering/doctrine.md` for stable engineering principles
- `docs/architecture/system-map.md` for the system boundary model
- `docs/architecture/stack-profile.md` for stack choices and substitution rules
- `docs/adr/` for durable architectural decisions
- `docs/templates/feature-brief.md` before building meaningful features

When a local choice becomes important enough that future agents need to preserve
it, document it close to the code or add an ADR.


---

## Generated Documentation Index

_Source: `generated-project/docs/README.md`_

# Documentation

This directory contains the reusable doctrine and project-local decisions for
`Reference Project`.

## Read Order

1. `../AGENTS.md`
2. `project-profile.md`
3. `engineering/doctrine.md`
4. `architecture/system-map.md`
5. `architecture/stack-profile.md`
6. Relevant ADRs in `adr/`
7. Relevant templates in `templates/`

## Ownership Model

The reusable doctrine gives the project a starting point. The project owns the
generated files after creation.

Use ADRs when a local decision changes architecture, authority, persistence,
workflow behavior, tool capabilities, or deployment strategy.


---

## Generated Project Profile

_Source: `generated-project/docs/project-profile.md`_

# Project Profile

Project: Reference Project

Reference rendering of the reusable agentic engineering doctrine.

## Template Source

This project was generated with Copier from the reusable agentic engineering
template.

The durable template metadata is stored in `.copier-answers.yml`. Do not edit
that file manually unless the template repository moves and `_src_path` must be
updated.

## Product Domain

- primary domain: Reusable agentic software

## Selected Stack

- frontend: Elm
- backend domain core: Haskell
- workflow runtime: Temporal
- durable database: PostgreSQL
- vector storage: PostgreSQL + pgvector
- policy engine: OPA / Rego
- cloud target: Undecided
- formal methods: included for critical invariants and workflow specs

## Local Doctrine Overrides

None yet.

When a project-specific decision intentionally overrides the reusable doctrine,
record it here briefly and add an ADR under `docs/adr/`.

## Project-Specific Constraints

None yet.

Use this section for constraints such as regulatory requirements, data residency,
tenant model, critical user workflows, third-party systems, or deployment limits.

## First Vertical Slice

Define the first runnable product slice here before adding application code:

```text
frontend intent -> API command -> domain transition -> durable record -> observable result
```

## Open Questions

- What is the first user-facing workflow?
- What data is the durable source of truth?
- What actions require human approval?
- What external systems can the application touch?
- What must be auditable from day one?


---

## Engineering Doctrine

_Source: `generated-project/docs/engineering/doctrine.md`_

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


---

## System Map

_Source: `generated-project/docs/architecture/system-map.md`_

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


---

## Stack Profile

_Source: `generated-project/docs/architecture/stack-profile.md`_

# Stack Profile

This is the stack profile for `Reference Project`. It starts from the reusable
high-purity agentic software defaults, then records this project's selected
choices.

The stack exists to enforce one boundary:

```text
LLMs may propose actions.
Only typed, verified, policy-checked, durable workflows may execute actions.
```

## Project Defaults

| Concern | Project choice | Reference default | Why it fits |
| --- | --- | --- | --- |
| Frontend | Elm | Elm | Explicit UI state, controlled commands, strong compiler feedback |
| Backend domain core | Haskell | Haskell | Pure domain logic, strong types, clear effect boundaries |
| Critical verification | Dafny where justified | Dafny | Machine-checked specs and invariants for high-risk logic |
| System modeling | TLA+ or Lean where justified | TLA+ or Lean | Concurrency, workflow, and invariant reasoning before implementation |
| Workflow runtime | Temporal | Temporal | Durable execution, retries, long-running processes, human-in-the-loop flows |
| Durable database | PostgreSQL | PostgreSQL | Transactions, constraints, locks, mature relational modeling |
| Vector storage | PostgreSQL + pgvector | PostgreSQL with pgvector first | Retrieval near metadata, permissions, and transactions |
| Dedicated vector search | Qdrant when needed | Qdrant when needed | Use when vector search becomes a separate scaling domain |
| Policy | OPA / Rego | OPA / Rego | Explicit policy-as-code outside prompts and scattered conditionals |
| Tool protocol | MCP behind a gateway | MCP behind a gateway | Useful integration protocol, not a trust boundary by itself |
| Tool sandbox | WebAssembly / Wasmtime where possible | WebAssembly / Wasmtime | Capability-shaped execution boundary for plugins and tools |
| LLM integration | Provider-agnostic gateway | Provider-agnostic gateway | Keeps prompts, schemas, models, and vendors behind a typed boundary |
| Build and release | Nix plus provenance practices | Nix plus provenance practices | Reproducible builds and auditable artifacts |
| Observability | OpenTelemetry | OpenTelemetry | Vendor-neutral traces, metrics, logs, and correlation |
| Cloud | Undecided | AWS or equivalent | Use replaceable infrastructure with least privilege and reproducibility |

## Substitution Rule

A technology can be replaced when the replacement preserves the same system
properties:

- typed boundaries
- explicit authority
- durable state
- constrained side effects
- recoverable workflows
- reproducible builds
- observable execution
- auditable decisions

If a replacement weakens one of these properties, write an ADR explaining the
tradeoff and compensating control.

## Stack Is Not Architecture

The architecture is not a specific language, framework, database, or cloud. The
architecture is the boundary model:

```text
intent -> typed command -> policy -> state transition -> workflow -> side effect
```

Keep this model even if the project uses different tools.

## When To Add A Layer

Add a layer when it protects a real boundary:

- add policy when authority is nontrivial
- add workflows when work is long-running, retryable, or externally dependent
- add verification when an invariant is critical and easy to get subtly wrong
- add a sandbox when third-party or generated code may execute
- add a dedicated vector database when retrieval has independent scale needs
- add infrastructure automation when manual setup would become unreproducible

Do not add tools only because the reference stack lists them.

## Early Vertical Slice

The first runnable slice should usually be:

```text
frontend intent
  -> API command
  -> domain transition
  -> PostgreSQL record
  -> trace/log/audit event
```

After that, add LLM planning, policy, workflows, retrieval, tools, and cloud
deployment incrementally as the product surface requires them.


---

## Feature Development Guide

_Source: `generated-project/docs/engineering/feature-development.md`_

# Feature Development Guide

Use this guide before building meaningful features. The goal is to keep feature
work connected to the whole system without creating heavyweight process.

## 1. Define User Intent

Write the user intent in one or two sentences:

```text
As a <user or actor>, I want to <intent>, so that <outcome>.
```

Then state what the system must not allow.

## 2. Name The Domain Concepts

Identify the domain objects involved. Prefer meaningful names:

- `ToolProposal`
- `ApprovalRequest`
- `DocumentIngestionRun`
- `PolicyDecision`
- `AgentRun`
- `RetrievedContext`

Avoid generic names when the concept matters:

- `payload`
- `data`
- `metadata`
- `result`
- `status`

Generic fields can exist, but they should not hide the system vocabulary.

## 3. Identify State And Events

For each lifecycle, define:

- states
- events
- valid transitions
- invalid transitions
- terminal states
- retry behavior
- cancellation behavior

Use the smallest state machine that explains the behavior.

## 4. Define Authority

Answer:

- who is authenticated?
- what is the user allowed to do?
- what may the agent do on the user's behalf?
- what capability does each tool expose?
- what requires approval?
- what is denied by default?

Policy should be testable outside prompt text.

## 5. Define Persistence

Identify durable facts and constraints:

- primary records
- ownership or tenant scope
- foreign keys
- uniqueness rules
- check constraints
- idempotency keys
- audit events
- outbox events

If a fact must survive retries, crashes, or worker restarts, it belongs in
durable storage or workflow history.

## 6. Define Side Effects

List each side effect:

- LLM call
- tool call
- email
- file write
- external API call
- notification
- payment
- queue publish
- cloud resource change

For each one, define:

- policy check
- timeout
- retry behavior
- idempotency key
- audit record
- failure state
- compensation if needed

## 7. Define LLM Boundaries

If an LLM is involved, define:

- input schema
- output schema
- allowed output variants
- validation behavior
- refusal or fallback behavior
- model/version trace
- retention rules
- prompt-injection handling

The feature should work safely when the LLM returns malformed, incomplete, or
overconfident output.

## 8. Define Observability

Every important action should carry correlation IDs such as:

- request id
- user id
- tenant id
- agent run id
- workflow id
- LLM call id
- tool proposal id
- tool invocation id
- approval id
- audit event id

Log enough structured data to reconstruct behavior without leaking secrets or
private content.

## 9. Define Tests

Test the invariants, not just examples:

- unauthorized access is rejected
- invalid transitions are rejected
- duplicate events do not duplicate effects
- malformed LLM output is rejected safely
- retrieval respects permissions
- high-risk actions require approval
- workflow retries preserve correctness
- database constraints reject impossible facts

## 10. Ship The Smallest Safe Slice

Prefer a thin vertical slice over disconnected layers:

```text
UI intent -> typed API -> domain transition -> durable record -> observable result
```

Then widen only where the feature needs it.


---

## Deployment Readiness

_Source: `generated-project/docs/engineering/deployment-readiness.md`_

# Deployment Readiness

Use this as a release gate for moving from local development to cloud users.
It is intentionally provider-neutral.

## Required Properties

Before deployment, the system should have:

- a reproducible local setup path
- explicit environment configuration
- no secrets committed to source
- database migrations that can run forward predictably
- rollback or mitigation notes for risky changes
- health checks or equivalent runtime probes
- structured logs and traces for critical paths
- audit records for state changes and side effects
- least-privilege credentials for services and tools
- a clear distinction between development, staging, and production
- tests covering critical invariants

## Configuration

Configuration should be explicit and environment-specific:

- database URLs
- service endpoints
- model/provider settings
- policy bundle paths
- workflow namespace or task queues
- telemetry exporters
- sandbox limits
- feature flags

Use examples and documentation for required variables, but never commit real
secrets.

## Database And Migrations

Migrations should preserve durable truth:

- constraints should be added intentionally
- backfills should be repeatable or idempotent
- destructive changes need a rollback or mitigation plan
- application code and schema changes should be deployable in a safe order
- production migrations should be observable

## Workflows

Durable workflows need deployment care:

- workflow definitions should be versioned safely
- activity timeouts should be explicit
- retries should be bounded and intentional
- idempotency keys should protect external effects
- stuck or waiting workflows should be discoverable
- manual intervention paths should be documented

## Policy

Policy should be deployed as a controlled artifact:

- default deny where practical
- test cases for allow and deny paths
- separation between user, agent, workflow, and tool authority
- audit trail for high-risk decisions
- approval requirements for high-risk actions

## Observability

A deployed system should answer:

- is the service healthy?
- are workflows progressing?
- are LLM calls failing, timing out, or drifting in schema compliance?
- are tools being denied or failing unexpectedly?
- are authorization failures expected or suspicious?
- are retries creating pressure or duplicate attempts?
- can a user-visible action be traced end to end?

## Release Notes

Every meaningful release should record:

- user-visible change
- schema or migration change
- policy change
- workflow change
- LLM prompt/schema/model change
- tool capability change
- operational risk
- verification performed

Keep release notes factual and short.


---

## Formal Methods Guidance

_Source: `generated-project/docs/engineering/formal-methods.md`_

# Formal Methods Guidance

Formal methods are not ceremony. They are a tool for making high-risk invariants
harder to misunderstand.

Use them where the cost of ambiguity is high:

- permission lattices
- workflow state machines
- approval invariants
- quota or accounting logic
- ledger or payment invariants
- retry and idempotency behavior
- concurrent tool execution
- document access guarantees

## Default Use

Start with ordinary typed domain code and tests. Add formal methods when a rule
is important enough that examples are not convincing.

Recommended roles:

- Dafny for implementation-adjacent verified modules
- TLA+ for distributed workflow, retry, approval, and concurrency models
- Lean only when proof depth is justified by the domain

## Good Candidate Questions

- Can this action ever execute without required approval?
- Can duplicate callbacks produce duplicate side effects?
- Can a denied policy path still reach a tool gateway?
- Can a workflow finish in an impossible state?
- Can concurrent events violate ownership or quota?

## Documentation Rule

If formal methods are introduced, add an ADR that explains:

- the invariant being protected
- why ordinary tests are not enough
- where the spec lives
- how the spec is checked
- what implementation code is covered by the spec


---

## ADR Guide

_Source: `generated-project/docs/adr/README.md`_

# Architecture Decision Records

Use ADRs for decisions that future developers or agents might reasonably
question.

Good ADR subjects:

- choosing or replacing a core technology
- changing a state machine
- introducing a new side-effect boundary
- exposing a new agent-facing tool
- changing policy or approval behavior
- changing persistence ownership or constraints
- changing deployment or infrastructure strategy
- accepting a meaningful security or reliability tradeoff

ADRs should be short. A decision that needs a long essay usually needs a clearer
problem statement.

Use `docs/templates/adr.md` as the starting point.


---

## Initial Doctrine ADR

_Source: `generated-project/docs/adr/0001-adopt-agentic-engineering-doctrine.md`_

# ADR: Adopt Agentic Engineering Doctrine

- status: accepted
- date: 2026-01-01
- owners: project maintainers

## Context

`Reference Project` is starting from a reusable doctrine for high-purity
agentic software.

The project needs a durable operating model before implementation choices start
to spread across frontend code, backend handlers, prompts, workflows, policy,
database schema, and infrastructure.

## Decision

Adopt the reusable engineering doctrine in `AGENTS.md`,
`docs/engineering/doctrine.md`, `docs/architecture/system-map.md`, and
`docs/architecture/stack-profile.md`.

The initial project stack profile is:

- frontend: Elm
- backend domain core: Haskell
- workflow runtime: Temporal
- durable database: PostgreSQL
- vector storage: PostgreSQL + pgvector
- policy engine: OPA / Rego
- cloud target: Undecided

## Rationale

The doctrine preserves the core boundary:

```text
LLMs may propose actions.
Only typed, verified, policy-checked, durable workflows may execute actions.
```

This keeps nondeterministic model behavior inside deterministic software
boundaries: typed inputs, explicit policy, state machines, durable persistence,
recoverable workflows, constrained tools, and observable side effects.

## Alternatives Considered

### Submodule

Rejected as the default. A submodule keeps doctrine centrally pinned, but makes
project-local customization and future updates more awkward. This project should
own its generated docs and update deliberately with Copier.

### Ad Hoc Project Docs

Rejected. Starting from ad hoc docs makes each project rediscover the same
authority, workflow, side-effect, and observability boundaries.

## Consequences

Future architecture decisions should either preserve this doctrine or explicitly
record the reason for a deviation.

Template updates can be pulled with `copier update`, but project-specific
decisions remain local and should be protected through ADRs.

## Verification

- `scripts/doctor.sh` verifies the expected documentation structure exists.
- Feature work should use `docs/templates/feature-brief.md`.
- Meaningful architecture changes should use `docs/templates/adr.md`.


---

## ADR Template

_Source: `generated-project/docs/templates/adr.md`_

# ADR: <short decision title>

- status: proposed
- date: YYYY-MM-DD
- owners: <names or roles>

## Context

What problem are we solving? What constraints matter?

## Decision

What are we choosing?

## Rationale

Why does this decision preserve or improve the system boundaries?

Consider:

- typed boundaries
- explicit authority
- durable state
- recoverable workflows
- constrained side effects
- observable execution
- reproducible deployment

## Alternatives Considered

What else did we consider, and why did we not choose it?

## Consequences

What becomes easier? What becomes harder? What risks or follow-up work remain?

## Verification

How will we know this decision is working?


---

## Feature Brief Template

_Source: `generated-project/docs/templates/feature-brief.md`_

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


---

## Agent Task Template

_Source: `generated-project/docs/templates/agent-task.md`_

# Agent Task Brief: <task name>

Use this template when assigning work to an agent or future coding session.

## Goal

What should be true when the task is complete?

## Context

Relevant files, docs, ADRs, or decisions:

- <path or note>

## Boundaries

What should the agent not change?

- <boundary>

## System Map

Where does this task sit?

- frontend state:
- API boundary:
- domain model:
- policy:
- state transition:
- persistence:
- workflow:
- side effects:
- observability:
- deployment:

## Expected Work

- <implementation or documentation step>

## Verification

- <command, test, review, or manual check>

## Open Questions

- <question>


---

## Template Maintainer Guide

_Source: `AGENTS.md`_

# Template Maintainer Guide

This repository is a Copier template for seeding new projects with a reusable
engineering doctrine for high-purity agentic software.

Generated project files live under `template/`. Files outside `template/` are
for maintaining this template repository and are not copied into generated
projects.

## Core Boundary

Preserve this doctrine across template changes:

```text
LLMs may propose actions.
Only typed, verified, policy-checked, durable workflows may execute actions.
```

Do not turn the template into a framework scaffold unless a real boundary needs
that code. This repository should seed principles, operating structure, decision
records, and project-local customization points.

## Maintainer Rules

- Keep generated files portable across product domains.
- Prefer variables in `copier.yml` over hard-coded project identity.
- Keep `AGENTS.md.jinja` short enough that future agents read it.
- Put reusable doctrine in `docs/engineering/`.
- Put architectural maps and stack defaults in `docs/architecture/`.
- Put project-local specialization in `docs/project-profile.md`.
- Use ADRs for decisions that future agents might reasonably question.
- Do not require submodules for normal use.
- Keep Copier update compatibility intact.

## Verification

After editing the template, generate a temporary project and run its local
doctor check:

```bash
rm -rf /tmp/agentic-template-check
copier copy . /tmp/agentic-template-check \
  --force \
  --vcs-ref=HEAD \
  --data project_name="Template Check" \
  --data project_slug="template-check" \
  --data project_description="Temporary generated project for template validation." \
  --data primary_domain="Template validation" \
  --data cloud_target="Undecided"

/tmp/agentic-template-check/scripts/doctor.sh
```

Then inspect the generated files for accidental template leakage.


---

## Technical Mechanics

_Source: `README.md`, from `## Template Mechanics` onward._

## Template Mechanics

The rest of this README is operational. It explains how to generate, update,
validate, version, and maintain the template.

### Create A New Project

From GitHub:

```bash
copier copy gh:saulrichardson/agentic-engineering-template /path/to/new-project
```

From a local checkout:

```bash
copier copy /Users/saulrichardson/projects/agentic-engineering-template /path/to/new-project
```

For non-interactive generation:

```bash
copier copy gh:saulrichardson/agentic-engineering-template /path/to/new-project \
  --data project_name="New Project" \
  --data project_slug="new-project" \
  --data project_description="Short project description." \
  --data primary_domain="Project domain" \
  --data cloud_target="AWS"
```

### Update An Existing Project

Inside a generated project:

```bash
copier check-update
copier update
```

If a project was generated from a local template path and should now update from
GitHub, edit `.copier-answers.yml`:

```yaml
_src_path: gh:saulrichardson/agentic-engineering-template
```

Then run:

```bash
copier check-update
copier update
```

### Template Layout

```text
copier.yml
template/
  AGENTS.md.jinja
  README.md.jinja
  .gitignore.jinja
  docs/
    project-profile.md.jinja
    engineering/
    architecture/
    adr/
    templates/
  scripts/
    doctor.sh.jinja
```

Files under `template/` are copied or rendered into generated projects. Files at
the repository root are for maintaining this template.

Files ending in `.jinja` are rendered by Copier. The final generated file drops
the `.jinja` suffix. For example:

```text
template/README.md.jinja -> README.md
template/scripts/doctor.sh.jinja -> scripts/doctor.sh
```

Static docs that do not need project variables stay as plain `.md` files.

### Validate The Template

Generate a temporary project and run its local doctor check:

```bash
rm -rf /tmp/agentic-template-check
copier copy . /tmp/agentic-template-check \
  --force \
  --vcs-ref=HEAD \
  --data project_name="Template Check" \
  --data project_slug="template-check" \
  --data project_description="Temporary generated project for template validation." \
  --data primary_domain="Template validation" \
  --data cloud_target="Undecided"

/tmp/agentic-template-check/scripts/doctor.sh
```

### Single-File Reader Artifact

To create one pass-around Markdown artifact from the repository docs:

```bash
scripts/assemble-single-artifact.sh
```

By default, this writes:

```text
AGENTIC_ENGINEERING_DOCTRINE.md
```

The script renders a temporary reference project first, then assembles the
reader artifact from normal Markdown files rather than `.jinja` template source.
It places technical setup and Copier mechanics at the end.

### Versioning

Tag template releases:

```bash
git tag v0.1.0
git push origin v0.1.0
```

Generated projects should update deliberately from tagged versions or a reviewed
branch.
