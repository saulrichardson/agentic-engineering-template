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
