# High-Integrity Agentic Engineering Doctrine

This is a single-file reader artifact assembled from the reusable high-integrity agentic engineering template.

It is meant to be passed to someone who needs one coherent artifact rather than a repository tree.

Generated from the current template repository contents.

Template repository: https://github.com/saulrichardson/agentic-engineering-template

Reference rendering notes:

- Project name: Reference Project
- Primary domain: Reusable high-integrity software
- Cloud target: Undecided
- The generated project sections use reference values where project-specific answers are required.
- Technical setup and Copier mechanics are intentionally placed at the end.


---

## Pedagogical Overview

_Source: `README.md`, before `## Template Mechanics`._

# High-Integrity Agentic Engineering Template

This repository is a reusable pedagogical documentation template for software
projects developed with autonomous coding agents.

It is not an application framework. It does not scaffold a frontend, backend,
database, cloud account, or agent runtime. It gives each new project a shared
engineering doctrine, a vocabulary, a set of first-principles design questions,
and a small set of project-local documents that make future technical decisions
easier to reason about.

It is not limited to applications that contain LLM agents. It applies to
ordinary web apps, APIs, infrastructure, workflows, internal tools, databases,
user interfaces, and products that contain runtime agents.

The purpose is to make every project start with the same core discipline:

```text
Autonomous agents may propose code, plans, and actions.
The system may accept them only through explicit boundaries:
typed inputs, domain rules, policy checks, review gates, state transitions,
tests, durable persistence, controlled side effects, and observable execution.
```

When the product itself contains LLMs or agentic workflows, the same doctrine
applies again at runtime:

```text
LLMs may propose actions.
Only typed, verified, policy-checked, durable workflows may execute actions.
```

## Why This Exists

Autonomous code generation amplifies existing software risks:

- unclear requirements
- scattered business rules
- implicit state machines
- uncontrolled side effects
- weak authorization boundaries
- unsafe data migrations
- race conditions
- invalid states
- inadequate tests
- poor observability
- unreviewable changes
- untraceable production behavior
- agent-generated code that works locally but violates architecture

The solution is not to stop using agents. The solution is to make the system's
intent, boundaries, invariants, and verification paths explicit enough that both
humans and coding agents can safely extend it.

The more autonomous the coding agent, the more explicit the boundaries must be.

## Two Agent Contexts

This doctrine covers two different agent contexts:

1. Coding agents
   Agents that write, modify, test, review, and document the codebase.

2. Product or runtime agents
   Agents inside the application that reason, plan, retrieve context, or use
   tools for end users.

The primary audience is the first category: autonomous coding agents working in
serious software repositories. If the product itself contains runtime agents,
the same discipline applies again inside the application.

## What This Template Teaches

The generated documentation trains humans and coding agents to think in terms of
boundaries rather than isolated tasks.

Coding-agent work follows this path:

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

Runtime product behavior follows this path:

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

If the product contains runtime LLMs or agents, add this specialized path:

```text
user intent
  -> typed intent object
  -> runtime agent proposes plan
  -> schema validation
  -> policy decision
  -> state transition
  -> durable workflow
  -> constrained side effect
  -> audit and telemetry
```

The generated docs repeatedly bring work back to these paths. This is
deliberate. The most common failure mode in growing systems is that meaning
becomes scattered. Business rules drift into route handlers, prompts, frontend
conditionals, webhook handlers, background jobs, admin scripts, and migrations.
State changes happen from many places. Side effects happen before durable state
is recorded. Authorization is checked inconsistently. Retries duplicate work.
Production incidents cannot be reconstructed.

This template pushes against that drift by making the important questions
visible from the start:

- What user intent is being served?
- What task intent is the coding agent acting on?
- What domain objects are involved?
- What states can those objects be in?
- What events may change those states?
- Who is allowed to perform the action?
- What may a service, workflow, coding agent, or runtime agent do on a user's
  behalf?
- What side effects can happen?
- What must be persisted before execution?
- What can be retried?
- What requires approval?
- What must be observable later?

The template also gives coding agents a procedural layer so they do not have to
infer process from philosophy alone. Generated projects include an execution
protocol, risk taxonomy, definition of done, contract catalog, threat model, and
tool registry. Those artifacts force agents to classify the change, name the
boundaries touched, select verification by risk, and report residual risk.

## The Core Mental Model

The generated project docs are organized around one mental model:

```text
software whose structure remains legible to autonomous agents
```

That means:

- prompts do not define authority
- frontend checks do not define security
- autonomous code changes are classified before implementation
- domain rules, state transitions, and side effects are explicit
- side-effect capabilities are narrow, not broad execution channels
- workflows own long-running and retryable side effects
- the database enforces durable facts where possible
- policy is testable outside prompt text
- telemetry records enough to reconstruct important behavior
- runtime LLM outputs are data, not commands

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
3. `docs/engineering/agent-execution-protocol.md`
4. `docs/engineering/definition-of-done.md`
5. `docs/engineering/doctrine.md`
6. `docs/engineering/agentic-runtime.md` if the product contains runtime agents
7. `docs/architecture/system-map.md`
8. `docs/architecture/stack-profile.md`
9. Relevant contracts in `docs/contracts/`
10. Relevant threat model in `docs/security/`
11. Relevant ADRs in `docs/adr/`
12. Relevant templates in `docs/templates/`

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
    agent-execution-protocol.md
    definition-of-done.md
    doctrine.md
    agentic-runtime.md
    feature-development.md
    deployment-readiness.md
    formal-methods.md
  architecture/
    system-map.md
    stack-profile.md
  contracts/
    README.md
    state-machines.md
    tool-registry.md
    llm-outputs.md
    workflow-events.md
    policy-inputs.md
    telemetry-events.md
  security/
    threat-model.md
  adr/
    README.md
    0001-adopt-agentic-engineering-doctrine.md
  templates/
    adr.md
    feature-brief.md
    agent-task.md
    threat-model.md
    tool-capability.md
    state-machine.md
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
- better risk taxonomy and agent execution gates
- better contract catalog structure
- better threat model prompts
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
repository. It is generated from the reusable high-integrity agentic engineering
template, then owned by this project.

Project-specific decisions override the base doctrine only when they are
recorded in `docs/project-profile.md` or an ADR under `docs/adr/`.

## North Star

Build systems whose behavior remains explicit, constrained, testable,
observable, and reviewable, even when much of the code is produced by
autonomous coding agents.

```text
Autonomous agents may propose code, plans, and actions.
The system may accept them only through explicit boundaries:
typed inputs, domain rules, policy checks, review gates, state transitions,
tests, durable persistence, controlled side effects, and observable execution.
```

When the application itself contains LLMs or agentic workflows, those runtime
agents must also be contained inside the same boundaries:

```text
LLMs may propose actions.
Only typed, verified, policy-checked, durable workflows may execute actions.
```

## Read Order

Before substantial work, read these files:

1. `AGENTS.md`
2. `docs/project-profile.md`
3. `docs/engineering/agent-execution-protocol.md`
4. `docs/engineering/definition-of-done.md`
5. `docs/engineering/doctrine.md`
6. `docs/engineering/agentic-runtime.md` if the product contains runtime agents
7. `docs/architecture/system-map.md`
8. `docs/architecture/stack-profile.md`
9. Relevant contract docs in `docs/contracts/`
10. Relevant threat model, feature brief, ADR, or local module documentation

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

Do not introduce a reference-stack component unless this project has selected it
or the feature requires the boundary that component protects.

## Operating Model

For coding-agent work, locate the change on this path:

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

For runtime product behavior, locate the feature on this path:

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

Most defects are caused by skipping or scattering one of these layers.

## Coding Agent Operating Contract

Coding agents must not treat a task as "write code until tests pass." For every
meaningful change, the agent must:

1. classify the change
2. identify affected boundaries
3. preserve domain rules
4. avoid widening scope
5. add or update verification
6. report what changed and why
7. flag risks and unresolved questions

Use `docs/engineering/agent-execution-protocol.md` for the full risk taxonomy
and gates.

## Non-Negotiable Boundaries

- Autonomous agent output is proposal, not authority.
- Runtime LLM output is data, not authority.
- User input is useful, not automatically valid.
- Frontend checks improve experience, not security.
- Policy lives in code or policy files, not only prompts.
- State changes go through explicit transitions.
- Side effects are durable, idempotent where possible, and auditable.
- External data, tool results, model outputs, and retrieved context are
  untrusted input.
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
  `send_any_email` as runtime-agent-facing capabilities
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
8. Is a runtime agent or LLM involved, and what typed output may it return?
9. Are side-effect capabilities or tools involved, and what narrow capability
   do they expose?
10. What telemetry and audit records are needed to reconstruct behavior?
11. What tests prove the important invariant?

Small changes do not require long documents. They still require clear answers.

## Runtime Agent And LLM Rules

This section applies when the product itself contains LLMs, runtime agents,
retrieval, planning, or tool use. For deeper guidance, read
`docs/engineering/agentic-runtime.md`.

Runtime LLM output is data, not authority.

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
but they should not be exposed as runtime-agent capabilities without a written
decision.

## Testing And Verification

Tests should focus on behavior and invariants:

- pure domain logic
- state transitions
- authorization and delegation
- database constraints
- idempotency and duplicate delivery
- workflow retry and compensation behavior
- runtime-agent and LLM schema parsing and refusal paths
- tool gateway allow/deny behavior
- retrieval authorization
- critical end-to-end flows

When changing production behavior, run the narrowest verification that proves the
change and broaden only when the blast radius requires it.

Verification depends on risk:

- docs-only: consistency review and path/link check
- pure domain: unit or property tests
- state machine: valid and invalid transition tests
- workflow: retry, idempotency, timeout, and compensation tests
- database: migration and constraint tests
- policy: allow and deny tests
- runtime-agent or LLM boundary: schema, refusal, and malformed-output tests
- tool capability: policy, approval, timeout, idempotency, and audit tests
- critical invariant: model-based tests, Dafny, TLA+, Lean, or equivalent specs

## Definition Of Done

A change is done only when:

- intended user or domain behavior is implemented
- affected boundaries are identified
- state transitions are explicit where relevant
- policy checks exist where relevant
- durable facts are persisted with constraints where relevant
- side effects are controlled and observable where relevant
- tests or checks cover important success and failure paths
- telemetry and audit behavior are considered
- contracts, docs, or ADRs are updated if architecture changed

## Documentation Discipline

Documentation should clarify decisions, not freeze implementation details too
early. Use:

- `docs/project-profile.md` for local project facts and deviations
- `docs/engineering/doctrine.md` for stable engineering principles
- `docs/architecture/system-map.md` for the system boundary model
- `docs/architecture/stack-profile.md` for stack choices and substitution rules
- `docs/contracts/` for state, capability, runtime-agent, policy, workflow, and
  telemetry contracts
- `docs/security/threat-model.md` for autonomous-agent and runtime-agent threat
  modeling
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
3. `engineering/agent-execution-protocol.md`
4. `engineering/definition-of-done.md`
5. `engineering/doctrine.md`
6. `engineering/agentic-runtime.md` if the product contains runtime agents
7. `architecture/system-map.md`
8. `architecture/stack-profile.md`
9. Relevant contracts in `contracts/`
10. Relevant threat model in `security/`
11. Relevant ADRs in `adr/`
12. Relevant templates in `templates/`

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

Reference rendering of the reusable high-integrity agentic engineering doctrine.

## Template Source

This project was generated with Copier from the reusable high-integrity
agentic engineering template.

The durable template metadata is stored in `.copier-answers.yml`. Do not edit
that file manually unless the template repository moves and `_src_path` must be
updated.

## Product Domain

- primary domain: Reusable high-integrity software

## Primary Users

- <user or actor>

## Tenant Model

- tenant boundary:
- ownership model:
- cross-tenant access rule:

## Data Sensitivity

- sensitive data classes:
- data that must never enter prompts:
- retention constraints:

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

## Approval Model

- actions requiring approval:
- approval actor:
- approval expiration:
- denial behavior:

## External Systems

| System | Purpose | Data shared | Side effects | Owner |
| --- | --- | --- | --- | --- |
|  |  |  |  |  |

## Irreversible Actions

- <action>

## Critical Invariants

- <invariant>

## First Vertical Slice

Define the first runnable product slice here before adding application code.
For an ordinary feature, this may not involve an LLM:

```text
frontend intent -> API command -> domain transition -> durable record -> observable result
```

If the product contains a runtime agent, use this reference slice:

```text
user submits intent
system creates UserIntent and AgentRun
workflow starts
LLM returns typed PlanProposal
system validates plan
policy allows or denies proposed action
ToolProposal is recorded if allowed
tool execution waits for capability and approval rules
audit event and trace are emitted
user sees result
```

## Known Non-Goals

- <non-goal>

## Open Questions

- What is the first user-facing workflow?
- What data is the durable source of truth?
- What actions require human approval?
- What external systems can the application touch?
- What must be auditable from day one?


---

## Agent Execution Protocol

_Source: `generated-project/docs/engineering/agent-execution-protocol.md`_

# Agent Execution Protocol

This protocol turns the engineering doctrine into a concrete work loop for
coding agents. Use it for every nontrivial change.

The more autonomous the coding agent, the more explicit the boundaries must be.
Do not treat a task as "write code until tests pass."

## Work Loop

1. Orient
   Read `AGENTS.md`, `docs/project-profile.md`, relevant ADRs, nearby code, and
   the contract docs for affected boundaries.

2. Classify the change
   Use the risk taxonomy below. A change may touch more than one class.

3. Identify affected boundaries
   Name the affected layers: frontend, API, domain, policy, state, persistence,
   workflow, runtime agent, LLM, tool, retrieval, side effect, observability,
   infrastructure.

4. State the plan
   List files or modules to change, tests to run, non-goals, and the main risk.
   Keep this short for low-risk work. Be explicit for high-risk work.

5. Implement narrowly
   Make the smallest change that preserves the boundary model. Do not widen
   scope without recording why.

6. Verify
   Run the narrowest checks that prove the change. Broaden verification when the
   blast radius crosses shared contracts, persistence, policy, workflows, tools,
   or user-visible behavior.

7. Report
   Summarize what changed, boundaries touched, verification performed, residual
   risks, and follow-up work.

## Change Classification

Classify every meaningful change before implementation. A change can have more
than one class.

| Class | Meaning | Common gates |
| --- | --- | --- |
| Docs-only | Documentation, examples, wording, or planning artifacts with no behavior change | consistency check |
| UI-only | Frontend representation or local UI state with no backend authority change | UI state check, screenshot or component test when useful |
| Domain | Business rule, validation, invariant, or state transition | unit/property/transition tests |
| API | Request/response shape, handler boundary, serialization, client contract | schema and compatibility tests |
| Persistence | Schema, migration, constraint, ownership, data lifecycle | migration and constraint tests, rollback/mitigation notes |
| Policy | Auth, delegation, approval, capability, tenant access | allow/deny tests and audit check |
| Workflow | Long-running process, retry, compensation, external dependency | retry/idempotency/failure tests |
| Side effect | External API, email, file, cloud resource, payment, queue, command execution | policy, idempotency, timeout, audit |
| Runtime agent | Prompt, LLM schema, retrieval, tool proposal, model behavior | schema/refusal/injection/denial tests |
| Infrastructure | Deployment, secrets, build, networking, observability | reproducibility and rollback/mitigation check |

## Change Risk Taxonomy

Low-risk changes:

- documentation edits
- copy changes
- local refactors with no behavior change
- tests that do not alter production code

Medium-risk changes:

- frontend state or validation
- API response shape
- pure domain validation
- noncritical data transformation
- new tests for existing behavior

High-risk changes:

- database migration or constraint change
- policy or authorization change
- workflow state or retry behavior
- LLM input/output schema
- retrieval permissions or document scope
- tool capability or side-effect behavior
- authentication, tenant, or ownership boundary
- observability changes for critical flows

Critical-risk changes:

- payment or financial movement
- irreversible external action
- secret handling
- broad tool exposure such as shell, SQL, arbitrary HTTP, or arbitrary email
- cross-tenant data access
- approval bypass or approval weakening
- production data deletion
- cloud resource mutation with user or cost impact

## Gates By Risk

Low risk:

- keep the change narrow
- run a relevant local check when practical
- report what changed

Medium risk:

- identify affected boundaries
- run focused tests or checks
- update docs if behavior or contracts changed

High risk:

- create or update a feature brief or ADR
- update the relevant contract catalog entry
- test success and denial/failure paths
- confirm observability or audit behavior
- define rollback, mitigation, or compensation where relevant

Critical risk:

- require an explicit approval model
- require a threat model
- require denial and failure-path tests
- require auditability before execution
- require rollback, mitigation, or compensation notes
- do not expose broad capabilities without a written ADR

## What Verification Means

Verification is risk-dependent. It does not always mean formal methods, and it
does not mean no verification for small changes.

Use the smallest proof that fits the risk:

- docs-only: consistency review and link/path check
- pure function: unit tests or property tests
- state machine: transition tests, invalid-transition tests, terminal-state tests
- workflow: retry, timeout, idempotency, cancellation, and compensation tests
- database: migration, rollback/mitigation, constraint, and duplicate-event tests
- policy: allow/deny tests with representative actors, tenants, and capabilities
- runtime-agent or LLM boundary: schema validation, refusal, malformed-output,
  and prompt-injection tests
- retrieval: permission-scope tests and source traceability checks
- tool capability: policy, approval, timeout, idempotency, audit, and failure tests
- critical invariant: model-based tests, Dafny, TLA+, Lean, or equivalent spec work

## Report Format

Use this shape for final reports when work is nontrivial:

```text
Changed:
- <short list>

Boundaries touched:
- <frontend/API/domain/policy/state/persistence/workflow/tool/etc.>

Verification:
- <commands or checks run>

Residual risk:
- <remaining risk or "none known">

Follow-up:
- <only if useful>
```


---

## Definition Of Done

_Source: `generated-project/docs/engineering/definition-of-done.md`_

# Definition Of Done

A change is done only when the implementation, contracts, verification, and
documentation match the risk of the change.

## Baseline

Every completed change should satisfy:

- the intended user or domain behavior is implemented
- affected boundaries are identified
- unrelated scope is left alone
- generated or temporary artifacts are not committed accidentally
- verification has been run or the reason it could not run is stated
- the final report names changes, verification, and residual risk

## Boundary Checks

When relevant, a completed change should also satisfy:

- frontend state represents loading, failure, stale, unauthorized, and success states
- API boundaries parse and validate typed requests
- domain rules live in domain code, not scattered handlers or prompts
- state transitions are explicit and invalid transitions are rejected
- policy checks exist before authority-sensitive actions
- durable facts are persisted with constraints where practical
- workflows own long-running, retryable, or externally dependent work
- side effects are controlled, idempotent where possible, and auditable
- runtime-agent or LLM outputs are typed, validated, and treated as untrusted data
- tool capabilities are narrow and registered in `docs/contracts/tool-registry.md`
- retrieval respects authorization and source traceability
- telemetry or audit events can reconstruct important behavior

## Documentation Done

Update docs when a change modifies:

- architecture or stack choices
- state machines
- policy inputs or authorization behavior
- runtime-agent or LLM schemas
- tool capabilities
- workflow events
- telemetry events
- database invariants
- threat model assumptions
- deployment or operational risk

Use ADRs for decisions future agents might reasonably question.

## Test Done

Tests should prove the important behavior, not only the happy path.

For high-risk and critical-risk changes, include failure or denial tests. For
critical-risk changes, include a rollback, mitigation, approval, or compensation
story before calling the work done.


---

## Engineering Doctrine

_Source: `generated-project/docs/engineering/doctrine.md`_

# Engineering Doctrine

We build software whose behavior remains explicit, constrained, testable,
observable, and reviewable, even when much of the code is produced by
autonomous coding agents.

This doctrine applies to ordinary web applications, APIs, databases,
infrastructure, workflows, internal tools, and products that contain runtime
agents or LLMs.

The general rule:

```text
Autonomous agents may propose code, plans, and actions.
The system may accept them only through explicit boundaries:
typed inputs, domain rules, policy checks, review gates, state transitions,
tests, durable persistence, controlled side effects, and observable execution.
```

When the application itself contains LLMs or agentic workflows, the same rule
applies again at runtime:

```text
LLMs may propose actions.
Only typed, verified, policy-checked, durable workflows may execute actions.
```

## Why This Exists

Autonomous code generation amplifies existing software risks:

- unclear requirements
- scattered business rules
- implicit state machines
- uncontrolled side effects
- weak authorization boundaries
- unsafe data migrations
- race conditions
- invalid states
- shallow tests
- poor observability
- unreviewable changes
- untraceable production behavior
- generated code that works locally but violates architecture

If humans manually hold the architecture in their heads, loose conventions can
survive for a while. When autonomous coding agents generate code, hidden
conventions break quickly. The more autonomous the coding agent, the more
explicit the system boundaries must be.

This doctrine exists to make intent, invariants, authority, side effects, and
verification visible enough that both humans and coding agents can safely extend
the codebase.

## General Software Principles

- Make requirements explicit.
- Make state explicit.
- Make events explicit.
- Make transitions explicit.
- Make authority explicit.
- Make side effects controlled.
- Make durable facts constrained.
- Make workflows recoverable.
- Make behavior observable.
- Make changes reviewable.
- Make tests prove invariants.
- Make deployments reproducible.

These principles matter whether or not the product contains LLMs.

## Development-Time Path

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

This path prevents an autonomous coding agent from treating a task as "write
code until tests pass." Passing tests is not enough if the change violates
authority, persistence, workflow, observability, or architectural boundaries.

## Runtime Path

Application behavior should still be understood across the full stack:

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

Every meaningful feature should know where it sits in this path.

## Authority Model

The system distinguishes:

- authentication: who is the actor?
- authorization: what may the actor do?
- delegation: what may another actor or agent do on the actor's behalf?
- capability: what exact tool, resource, or operation is available now?
- approval: does this action require human confirmation?

Users, services, workflows, coding agents, runtime agents, and tools may all
have different authority boundaries. Prompts, UI visibility, and generated code
do not define authority.

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

## Side-Effect Capability Model

Side effects include database writes, LLM calls, emails, uploads, external API
calls, payments, file writes, command execution, queue publishes, notifications,
and cloud resource changes.

The preferred sequence is:

```text
decide
persist the decision
record the event
execute side effects through a workflow, outbox, or controlled capability
observe the result
```

Side effects should be visible, bounded, policy-checked, retryable where
possible, idempotent where practical, and auditable.

Tools are one kind of side-effect capability. They must be narrow, typed,
capability-scoped, and registered before they are exposed to runtime agents or
automation.

## Persistence Model

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

Long-running, failure-prone, multi-step work belongs in durable workflows or an
equivalent recoverable execution model.

Use workflows for processes such as:

- approval flows
- tool execution
- document ingestion
- external API orchestration
- scheduled operations
- human-in-the-loop work
- retryable side effects
- runtime agent execution

A worker crash should not erase the business process.

## Nondeterministic Component Model

LLMs are one example of nondeterministic components. Others include autonomous
coding agents, recommendation models, classifiers, external APIs, user-submitted
documents, retrieved context, and tool outputs.

The rule is:

```text
nondeterministic output is input, not authority
```

Any nondeterministic output that affects behavior must pass through the same
software boundaries as other untrusted input: parsing, validation, domain rules,
policy, state transitions, persistence, tests, and observability.

LLM-specific runtime guidance lives in `docs/engineering/agentic-runtime.md`.

## Observability Model

Every important action should be reconstructable.

The system should be able to answer:

- what task or user intent started this?
- what code, state, or context was involved?
- what boundary was crossed?
- what policy was evaluated?
- what state changed?
- what side effect occurred?
- what failed or retried?
- what tests or checks support the change?
- what was recorded for audit or review?

Use structured logs, traces, metrics, audit events, and stable correlation IDs.
Do not leak secrets or private data into telemetry.

## Ordinary Feature Example

No product LLM is required for the doctrine to apply.

Example: user profile update.

```text
user submits profile change
API validates typed input
domain rules decide allowed fields
policy checks ownership
database persists constrained facts
audit records change
telemetry records outcome
```

## Migration Example

Example: database migration proposed by a coding agent.

```text
task is classified as persistence risk
schema ownership and invariants are identified
migration and rollback/mitigation are considered
tests verify old and new behavior
ADR is added if ownership or invariants changed
deployability check is reported
```

## Workflow Example

Example: background billing job.

```text
workflow owns retries
idempotency prevents duplicate charge
database records durable state
side effects are audited
failure path is observable
```

## Final Test

For any significant design, future maintainers and coding agents should be able
to understand:

- what state exists
- how it can change
- who can change it
- what effects happen
- what was recorded
- what can be retried
- what can be audited
- what can fail
- what verification supports it

If those answers are unclear, the design is drifting.


---

## Agentic Runtime Guidance

_Source: `generated-project/docs/engineering/agentic-runtime.md`_

# Agentic Runtime Guidance

This document applies when the product itself contains LLMs, runtime agents,
retrieval, planning, or tool use.

It is a specialization of the general engineering doctrine. Runtime agents
inside the product must be contained by the same boundaries that guide
autonomous coding agents during development.

## Runtime Rule

```text
LLMs may propose actions.
Only typed, verified, policy-checked, durable workflows may execute actions.
```

LLM output is data, not authority.

## Allowed Runtime Agent Outputs

An LLM or runtime agent may return typed objects such as:

- `AnswerDraft`
- `ClarifyingQuestion`
- `PlanProposal`
- `ToolProposal`
- `Classification`
- `Extraction`
- `Summary`
- `Refusal`

It must not directly execute unchecked mutations.

## Runtime Agent Flow

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

The agent proposes. The system decides and executes.

## Tool Proposals

Tool proposals must be:

- parsed
- schema validated
- policy checked
- state checked
- approval checked when required
- recorded before execution
- executed through a narrow capability
- audited after execution

Avoid broad runtime-agent tools:

- `run_sql`
- `execute_shell`
- `http_request`
- `send_any_email`
- `write_any_file`

Prefer narrow capabilities:

- `searchAuthorizedDocuments`
- `createDraftEmail`
- `submitApprovedTicket`
- `lookupOrderStatus`
- `scheduleApprovedCalendarEvent`

Every runtime-agent-facing tool belongs in `docs/contracts/tool-registry.md`.

## Retrieval

Retrieval is controlled access to information, not informal prompt stuffing.

The system must ensure:

- the user may access retrieved documents
- the runtime agent may use those documents for this task
- retrieved text cannot override system policy
- document sources are traceable
- sensitive data is handled intentionally
- retrieval events are logged

Retrieved context and external documents are untrusted input.

## Prompt Injection And Tool Results

Tool outputs, webpages, documents, emails, PDFs, and external API responses can
contain instructions hostile to the system.

Runtime agents must not treat those results as authority. Tool results can
inform the next proposal, but they cannot modify policy, approval, credentials,
state transitions, or allowed tool capabilities.

## Approval

High-risk runtime actions require explicit approval. Approval is separate from
authorization.

Approval rules should define:

- what action requires approval
- who may approve it
- how long approval lasts
- what exact proposal was approved
- what happens when approval is denied or expires
- what audit event records the decision

## Required Runtime Contracts

When adding runtime agents, update the relevant contract docs:

- `docs/contracts/llm-outputs.md`
- `docs/contracts/tool-registry.md`
- `docs/contracts/state-machines.md`
- `docs/contracts/workflow-events.md`
- `docs/contracts/policy-inputs.md`
- `docs/contracts/telemetry-events.md`
- `docs/security/threat-model.md`

## Verification

Runtime-agent changes should test:

- schema validation
- malformed output
- refusal path
- prompt-injection path
- unauthorized retrieval
- denied policy decision
- approval required
- duplicate tool callback
- idempotency or compensation
- audit and trace output


---

## System Map

_Source: `generated-project/docs/architecture/system-map.md`_

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


---

## Stack Profile

_Source: `generated-project/docs/architecture/stack-profile.md`_

# Stack Profile

This is the stack profile for `Reference Project`. It starts from the reusable
high-integrity software defaults for projects developed with autonomous coding
agents, then records this project's selected choices.

The stack exists to enforce one boundary:

```text
Autonomous agents may propose code, plans, and actions.
The system may accept them only through explicit boundaries:
typed inputs, domain rules, policy checks, review gates, state transitions,
tests, durable persistence, controlled side effects, and observable execution.
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
| Runtime LLM integration | Provider-agnostic gateway when needed | Provider-agnostic gateway | Keeps prompts, schemas, models, and vendors behind a typed boundary when the product contains LLMs |
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

Do not introduce a reference-stack component unless the current project has
selected it or the feature requires the boundary that component protects.

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

After that, add policy, workflows, retrieval, runtime-agent planning, tools,
and cloud deployment incrementally as the product surface requires them.


---

## Feature Development Guide

_Source: `generated-project/docs/engineering/feature-development.md`_

# Feature Development Guide

Use this guide before building meaningful features. The goal is to keep feature
work connected to the whole system without creating heavyweight process.

## 1. Define Intent

Write the user, operator, or system intent in one or two sentences:

```text
As a <user or actor>, I want to <intent>, so that <outcome>.
```

For coding-agent tasks, also state the development intent:

```text
Given <repository context>, change <system behavior or documentation> so that <outcome>.
```

Then state what the system or coding agent must not change or allow.

## 2. Name The Domain Concepts

Identify the domain objects involved. Prefer meaningful names:

- `UserProfile`
- `BillingRun`
- `Membership`
- `StateTransition`
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
- what may another actor, service, coding agent, or runtime agent do on the
  user's behalf?
- what capability does each side-effect path expose?
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

## 7. Define Runtime Agent Or LLM Boundaries

If a runtime agent, LLM, classifier, recommendation model, or other
nondeterministic component is involved, define:

- input schema
- output schema
- allowed output variants
- validation behavior
- refusal or fallback behavior
- model/version trace
- retention rules
- prompt-injection handling

The feature should work safely when the component returns malformed,
incomplete, overconfident, or adversarially influenced output.

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
- malformed runtime-agent or LLM output is rejected safely
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

## Contract Catalog

_Source: `generated-project/docs/contracts/README.md`_

# Contract Catalog

This directory is the durable home for system contracts that should not be
buried only in prompts, source comments, route handlers, or tribal knowledge.

Contracts are the named boundaries other code relies on:

- state machines
- runtime-agent and LLM output variants and schemas
- tool and side-effect capabilities
- workflow events
- policy inputs
- telemetry and audit events
- database invariants

When a change adds or changes a contract, update this catalog in the same change
or explain why the contract is documented elsewhere.

## Files

- `state-machines.md`: lifecycle states, events, guards, and terminal states
- `tool-registry.md`: tool and side-effect capability registry
- `llm-outputs.md`: runtime LLM output shapes and validation expectations
- `workflow-events.md`: workflow events, retry semantics, and idempotency notes
- `policy-inputs.md`: policy decision inputs and authority model
- `telemetry-events.md`: trace, log, metric, and audit event names

## Contract Rule

If another module, workflow, tool, policy, prompt, or external integration must
depend on a shape or lifecycle, it is a contract. Name it here.


---

## State Machine Contracts

_Source: `generated-project/docs/contracts/state-machines.md`_

# State Machine Contracts

Use this file to record important lifecycles. Do not let important statuses
become strings assigned from arbitrary code.

## Required Fields

For each state machine, record:

- owner module
- states
- events
- valid transitions
- invalid transitions
- guards
- terminal states
- audit events
- retry or cancellation behavior

## Agent Run Reference

This is a reference shape. Rename or replace it when the project defines its
real domain objects.

States:

- `created`
- `context_gathering`
- `planning`
- `awaiting_approval`
- `executing`
- `waiting_external_result`
- `completed`
- `failed`
- `cancelled`

Events:

- `UserIntentAccepted`
- `ContextGathered`
- `PlanProposed`
- `ApprovalRequested`
- `ApprovalGranted`
- `ApprovalDenied`
- `ToolInvocationStarted`
- `ToolInvocationSucceeded`
- `ToolInvocationFailed`
- `ExternalResultReceived`
- `AgentRunCompleted`
- `AgentRunFailed`
- `AgentRunCancelled`

Rules:

- no tool may execute directly from `planning`
- approval-required actions must pass through `awaiting_approval`
- terminal states are `completed`, `failed`, and `cancelled`
- duplicate events must not create duplicate side effects

## Tool Invocation Reference

States:

- `proposed`
- `policy_checked`
- `approval_required`
- `approved`
- `executing`
- `succeeded`
- `failed`
- `rejected`
- `compensated`

Rules:

- `proposed` cannot move to `executing` without policy check
- approval-required tools cannot move to `executing` without approval
- `succeeded`, `rejected`, and `compensated` are terminal unless an ADR says otherwise

## Project State Machines

Add project-specific state machines below.


---

## Tool Capability Registry

_Source: `generated-project/docs/contracts/tool-registry.md`_

# Tool And Side-Effect Capability Registry

Every runtime-agent-facing or automation-facing tool must be registered here
before it is exposed to an LLM, agent runtime, workflow, MCP gateway, or other
side-effect capability boundary.

Broad tools require an ADR. Examples include arbitrary SQL, shell execution,
arbitrary HTTP, arbitrary file write, and arbitrary email send.

## Registry

| Tool name | Purpose | Input type | Output type | Allowed actors | Policy rule | Approval | Side effect | Idempotency key | Timeout | Audit event | Failure states |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| `searchAuthorizedDocuments` | Retrieve authorized context | `DocumentSearchInput` | `RetrievedContext[]` | workflow | `can_retrieve_document` | no | read only | request id | 10s | `document_retrieval_performed` | failed, denied |
| `createDraftEmail` | Create draft content without sending | `DraftEmailInput` | `DraftEmail` | workflow | `can_create_draft` | no | draft only | draft id | 10s | `draft_email_created` | failed, denied |

## Required Tool Fields

For each tool, define:

- purpose
- typed input
- typed output
- allowed actors
- policy rule
- approval requirement
- side effect
- idempotency behavior
- timeout
- audit event
- failure states

## Tool Rules

- tools must be narrow capabilities
- tool outputs are untrusted input
- tool errors must have typed failure states
- high-risk tools require approval or ADR-backed justification
- critical-risk tools require a threat model


---

## LLM Output Contracts

_Source: `generated-project/docs/contracts/llm-outputs.md`_

# LLM Output Contracts

This file applies only when the product contains runtime LLM boundaries,
runtime agents, retrieval, planning, or model-generated outputs that affect
system behavior.

LLM output is data, not authority. Every LLM response used by the system must
map to an allowed output type and pass validation before it affects state,
policy, workflows, tools, or persistence.

## Allowed Output Variants

- `AnswerDraft`
- `ClarifyingQuestion`
- `PlanProposal`
- `ToolProposal`
- `Classification`
- `Extraction`
- `Summary`
- `Refusal`

## Required Fields Per LLM Boundary

For each LLM boundary, record:

- caller
- model or provider class
- input type
- output type
- allowed variants
- schema validator
- refusal behavior
- malformed-output behavior
- prompt-injection handling
- retention policy
- trace or audit event

## Boundary Registry

| Boundary | Input type | Output type | Allowed variants | Validator | Failure behavior | Trace event |
| --- | --- | --- | --- | --- | --- | --- |
| Reference planning call | `UserIntentContext` | `AgentPlanResult` | `PlanProposal`, `ClarifyingQuestion`, `Refusal` | schema validator | reject and ask clarification | `llm_plan_completed` |

## Rules

- malformed output is rejected safely
- model refusal is a valid output, not an exception
- retrieved context cannot override policy
- prompts must not contain secrets
- tool calls are proposals until policy, state, and approval checks pass


---

## Workflow Event Contracts

_Source: `generated-project/docs/contracts/workflow-events.md`_

# Workflow Event Contracts

Durable workflows should expose meaningful events. These event names are part of
the system contract because retries, idempotency, telemetry, and support tools
depend on them.

## Required Fields

For each workflow event, record:

- workflow name
- event name
- payload type
- idempotency key
- retry behavior
- side effects triggered
- audit or telemetry event
- failure states

## Reference Workflow Events

| Workflow | Event | Payload | Idempotency key | Side effect | Failure behavior |
| --- | --- | --- | --- | --- | --- |
| `AgentRunWorkflow` | `UserIntentAccepted` | `UserIntent` | intent id | create run | reject duplicate |
| `AgentRunWorkflow` | `PlanProposed` | `PlanProposal` | llm call id | none | reject malformed |
| `AgentRunWorkflow` | `ToolProposalRecorded` | `ToolProposal` | proposal id | none | reject unauthorized |
| `AgentRunWorkflow` | `ToolInvocationSucceeded` | `ToolResult` | invocation id | record result | retry-safe |

## Rules

- workflows should record decisions before side effects
- external callbacks need idempotency keys
- retries must not produce duplicate side effects
- approval waiting states must be visible
- cancellation behavior must be explicit


---

## Policy Input Contracts

_Source: `generated-project/docs/contracts/policy-inputs.md`_

# Policy Input Contracts

Policy must be explicit and testable outside prompt text. This file records the
inputs policy decisions rely on.

## Authority Dimensions

- authenticated actor
- tenant or organization scope
- user role or membership
- coding-agent or runtime-agent delegation scope
- workflow identity
- tool capability
- resource ownership
- data sensitivity
- approval state
- environment

## Policy Decision Registry

| Decision | Input fields | Allowed result | Denied result | Audit event |
| --- | --- | --- | --- | --- |
| `can_start_agent_run` | actor, tenant, intent type | allow | deny | `policy_agent_run_checked` |
| `can_retrieve_document` | actor, tenant, document labels, task scope | allow | deny | `policy_retrieval_checked` |
| `can_execute_capability` | actor, workflow, capability, approval state | allow | deny | `policy_capability_execution_checked` |

## Rules

- default deny where practical
- frontend visibility is not authorization
- autonomous-agent or LLM output is not a policy input unless explicitly modeled
  as untrusted data
- policy decisions should be logged without leaking secrets
- approval is separate from authorization


---

## Telemetry And Audit Event Contracts

_Source: `generated-project/docs/contracts/telemetry-events.md`_

# Telemetry And Audit Event Contracts

Telemetry should make important behavior reconstructable without leaking secrets
or private data.

## Correlation IDs

Carry these IDs when relevant:

- request id
- user id
- tenant id
- agent run id
- workflow id
- LLM call id
- tool proposal id
- tool invocation id
- approval id
- state transition id
- audit event id

## Event Registry

| Event | Type | Required fields | Sensitive fields excluded | Purpose |
| --- | --- | --- | --- | --- |
| `user_intent_received` | audit | user id, tenant id, intent id | raw secrets | record user request |
| `llm_call_completed` | trace | model, call id, output variant | prompt secrets | reconstruct model boundary |
| `policy_decision_recorded` | audit | decision, actor, resource, result | secret values | explain allow/deny |
| `tool_invocation_recorded` | audit | tool, invocation id, result | raw credentials | reconstruct side effect |
| `state_transition_applied` | audit | object id, from, to, event | private payloads | explain lifecycle |

## Rules

- log structured facts, not prompt dumps by default
- never log secrets
- redact sensitive content intentionally
- audit high-risk state changes and side effects
- traces should connect user intent, LLM calls, policy, tools, workflows, and persistence


---

## Threat Model

_Source: `generated-project/docs/security/threat-model.md`_

# Threat Model

This project should maintain a live threat model for autonomous-agent,
runtime-agent, and high-risk software changes. Start here before adding broad
retrieval, new tool classes, approval changes, external side effects,
tenant-sensitive data access, secret handling, or broad coding-agent authority.

## Scope

- project:
- primary users:
- tenant model:
- sensitive data:
- external systems:
- irreversible actions:

## Development-Time Agent Questions

- What can coding agents read?
- What can coding agents write?
- What repository, cloud, database, or deployment credentials can they access?
- What commands, tools, or automation can they run?
- What changes require human review before merge or deployment?
- What generated code paths are high risk?
- What is the worst change a coding agent could make without detection?
- How would that change be caught before production?

## Runtime Agent Questions

Use these when the product contains LLMs, retrieval, planning, runtime agents,
or user-facing automation.

- What can the LLM see?
- What can the LLM propose?
- What can the LLM never see?
- What tools exist?
- What tools are broad or high risk?
- What data can retrieval access?
- What actions require approval?
- What happens if retrieved text contains prompt injection?
- What happens if a tool result is malicious?
- What secrets exist?
- What tenant boundary exists?
- What is the worst unauthorized action?
- How would that action be detected after the fact?

## Required Controls

- secrets are not exposed to prompts
- tools are capability-scoped
- retrieved documents are authorized before use
- tool results are treated as untrusted input
- approval-required actions cannot execute without approval
- policy decisions are auditable
- cross-tenant access is denied by default
- high-risk side effects are idempotent or compensated where possible
- coding-agent changes are reviewed according to risk before shipping
- deployment credentials are least privilege and not available to prompts

## Open Threats

| Threat | Impact | Likelihood | Control | Owner | Status |
| --- | --- | --- | --- | --- | --- |
| Prompt injection in retrieved document | unauthorized proposal or exfiltration attempt | medium | treat context as untrusted; policy gate tools | project maintainers | open |

## Review Triggers

Review this threat model when adding or changing:

- LLM boundaries
- coding-agent permissions
- retrieval scope
- tool capabilities
- policy rules
- approval flows
- tenant model
- data sensitivity
- external side effects
- secrets handling


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
- exposing a new runtime-agent-facing tool or side-effect capability
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

# ADR: Adopt High-Integrity Agentic Engineering Doctrine

- status: accepted
- date: 2026-01-01
- owners: project maintainers

## Context

`Reference Project` is starting from a reusable doctrine for high-integrity
software developed with autonomous coding agents.

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

The doctrine preserves the core development boundary:

```text
Autonomous agents may propose code, plans, and actions.
The system may accept them only through explicit boundaries:
typed inputs, domain rules, policy checks, review gates, state transitions,
tests, durable persistence, controlled side effects, and observable execution.
```

When the product itself contains runtime LLMs or agents, the same doctrine
applies at runtime:

```text
LLMs may propose actions.
Only typed, verified, policy-checked, durable workflows may execute actions.
```

This keeps autonomous and nondeterministic behavior inside explicit software
boundaries: typed inputs, domain rules, policy checks, review gates, state
machines, durable persistence, recoverable workflows, constrained side effects,
tests, and observable execution.

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

## Threat Model Template

_Source: `generated-project/docs/templates/threat-model.md`_

# Threat Model: <scope>

- status: draft
- owner:
- date: YYYY-MM-DD

## Scope

- feature or system:
- users:
- tenant boundary:
- sensitive data:
- external systems:
- side effects:

## Development-Time Agent Exposure

- what can coding agents read?
- what can coding agents write?
- what credentials, commands, or automations can they access?
- what change types require human review?
- what deployment or data paths are off limits?

## Runtime Agent Or LLM Exposure

Use this section when the product contains runtime agents, LLMs, retrieval, or
model-generated outputs.

- what can the LLM see?
- what can the LLM propose?
- what is never sent to the LLM?
- what output schemas are allowed?

## Retrieval

- data sources:
- authorization rule:
- sensitive labels:
- prompt-injection handling:
- source traceability:

## Tools

| Tool | Capability | Side effect | Approval | Policy rule | Audit event |
| --- | --- | --- | --- | --- | --- |
|  |  |  |  |  |  |

## Threats

| Threat | Impact | Likelihood | Control | Detection | Residual risk |
| --- | --- | --- | --- | --- | --- |
|  |  |  |  |  |  |

## Worst Unauthorized Action

Describe the worst plausible unauthorized action and how the system prevents,
detects, and mitigates it.

## Required Tests

- denial path:
- malformed runtime-agent or LLM output:
- prompt injection:
- unauthorized retrieval:
- approval required:
- idempotency or compensation:


---

## Tool Capability Template

_Source: `generated-project/docs/templates/tool-capability.md`_

# Tool Capability: <tool name>

- status: draft
- owner:
- date: YYYY-MM-DD

## Purpose

What narrow side-effect capability does this tool expose?

## Contract

- tool name:
- input type:
- output type:
- allowed actors:
- policy rule:
- approval requirement:
- timeout:
- idempotency key:
- audit event:
- failure states:

## Side Effects

What can this tool change outside memory?

## Security Notes

- secrets exposed to tool:
- secrets exposed to runtime agents or LLMs:
- tenant scope:
- prompt-injection risk:
- malicious-result handling:

## Verification

- allow test:
- deny test:
- malformed input test:
- timeout test:
- idempotency test:
- audit test:

## Registry Update

Add this tool to `docs/contracts/tool-registry.md` before exposing it.


---

## State Machine Template

_Source: `generated-project/docs/templates/state-machine.md`_

# State Machine: <name>

- status: draft
- owner:
- date: YYYY-MM-DD

## Purpose

What lifecycle does this state machine protect?

## States

- `created`

## Events

- `EventName`

## Transitions

| From | Event | Guard | To | Audit event |
| --- | --- | --- | --- | --- |
|  |  |  |  |  |

## Invalid Transitions

- <invalid transition>

## Terminal States

- <terminal state>

## Retry, Cancellation, And Compensation

- retry behavior:
- cancellation behavior:
- compensation behavior:

## Invariants

- <invariant that must always hold>

## Tests

- valid transition:
- invalid transition:
- terminal state:
- duplicate event:
- concurrency/idempotency:


---

## Template Maintainer Guide

_Source: `AGENTS.md`_

# Template Maintainer Guide

This repository is a Copier template for seeding new projects with a reusable
engineering doctrine for high-integrity software developed with autonomous
coding agents.

Generated project files live under `template/`. Files outside `template/` are
for maintaining this template repository and are not copied into generated
projects.

## Core Boundary

Preserve this doctrine across template changes:

```text
Autonomous agents may propose code, plans, and actions.
The system may accept them only through explicit boundaries:
typed inputs, domain rules, policy checks, review gates, state transitions,
tests, durable persistence, controlled side effects, and observable execution.
```

Runtime LLM guidance is a specialization of this broader doctrine, not the whole
scope of the template.

Do not turn the template into a framework scaffold unless a real boundary needs
that code. This repository should seed principles, operating structure, decision
records, and project-local customization points.

## Maintainer Rules

- Keep generated files portable across product domains.
- Prefer variables in `copier.yml` over hard-coded project identity.
- Keep `AGENTS.md.jinja` short enough that future agents read it.
- Put reusable doctrine in `docs/engineering/`.
- Put operational contracts in `docs/contracts/`.
- Put threat-model guidance in `docs/security/` and templates in `docs/templates/`.
- Put architectural maps and stack defaults in `docs/architecture/`.
- Put project-local specialization in `docs/project-profile.md`.
- Use ADRs for decisions that future agents might reasonably question.
- Do not require submodules for normal use.
- Keep Copier update compatibility intact.

## Verification

After editing the template, generate a temporary project from the current
worktree and run its local doctor check:

```bash
scripts/validate-template.sh
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

Generate a temporary project from the current worktree and run its local doctor
check:

```bash
scripts/validate-template.sh
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
