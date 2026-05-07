# Definition Of Done

A change is done only when the implementation, contracts, verification, and
documentation match the risk of the change.

## Baseline

Every completed change should satisfy:

- the intended user or domain behavior is implemented
- affected boundaries are identified
- unrelated scope is left alone
- implementation languages and tools follow the project profile, or a
  substitution is recorded with its boundary and rationale
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
- implementation language or toolchain choices
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
