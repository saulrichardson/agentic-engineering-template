# Agent Execution Protocol

This protocol turns the engineering doctrine into a practical work loop for
autonomous coding agents. Use it for meaningful work, and scale the detail to
the task.

The goal is useful completed work with clear evidence.

## Instruction Interpretation Mode

Before substantial work, decide how to interpret the request.

Use literal mode when the requester gives exact steps, exact wording, or precise
constraints. Treat the instructions as the artifact contract.

Use interpretive mode when the requester gives a goal, rough idea, symptom, or
desired outcome. Preserve the goal, inspect the repository, make reasonable
engineering choices, and explain the important decisions.

For interpretive work, state the edit contract when the change is substantial:

- what role the result should play
- what stays stable
- what changes
- what remains outside the current task

When ambiguity affects architecture, persistence, security, deployment, public
API, or user-visible behavior, present a clear recommendation or a small set of
options.

## Decision Latitude

Coding agents may choose the implementation approach that best serves the goal.

Local choices can happen directly:

- internal names
- helper functions
- small file organization changes
- tests and fixtures
- local docs
- formatting and mechanical cleanup near the change

Durable choices deserve a note in `docs/project-profile.md` or an ADR:

- public API
- database schema
- auth or tenant model
- deployment architecture
- major dependency
- framework or language choice
- broad refactor
- irreversible operation

## Work Loop

1. Orient
   Read `AGENTS.md`, `docs/project-profile.md`, relevant ADRs, nearby code,
   tests, configs, and docs.

2. Understand the goal
   Name the user, developer, or system outcome the work should create.

3. Find the natural home
   Identify the affected area: UI, API, domain, policy, state, persistence,
   workflow, integration, observability, infrastructure, docs, or tooling.

4. Form a working theory
   Decide what change will satisfy the goal and what evidence will prove it.

5. Implement coherently
   Change code, tests, docs, scripts, or configuration as needed for a complete
   result.

6. Verify
   Run the narrowest useful checks first. Broaden verification when the change
   crosses shared behavior, data, deployment, or security.

7. Report
   Summarize what changed, what was verified, which decisions were recorded, and
   what remains open.

## Root Cause Before Patch

When a failure appears, identify the likely cause before changing code.

Useful cause categories:

- requirement interpretation
- invalid input
- domain model mismatch
- permission or policy gap
- state transition issue
- persistence mismatch
- workflow ordering
- external integration failure
- test setup issue
- environment or configuration issue

Fix the cause where practical. When multiple causes remain plausible, report the
evidence and choose the most useful next step.

## Change Sizing

Classify work by blast radius:

| Size | Meaning | Useful evidence |
| --- | --- | --- |
| Small | Local docs, wording, tests, styling, or helper code | targeted check or careful inspection |
| Medium | User-visible behavior, shared module, API shape, domain rule, or config | tests plus manual or integration check when useful |
| Large | Persistence, deployment, security, public API, infrastructure, or broad refactor | focused plan, tests, migration/deploy notes, ADR when durable |

Use the smallest process that gives the next reviewer confidence.

## Verification Bands

Match verification to risk:

- docs-only: inspect rendered structure and links
- UI: component check, screenshot, or browser smoke test
- domain behavior: unit, property, or scenario tests
- API: schema, handler, client, or compatibility tests
- persistence: migration, constraint, rollback, or data-shape checks
- policy/security: allow/deny tests and auditability check
- workflow/integration: retry, timeout, idempotency, and failure-path checks
- infrastructure/deploy: build, plan, dry run, smoke test, and rollback note
- tooling: run the command from a clean or representative environment

When a command is unavailable locally, record the blocker and the strongest
evidence available.

## Reporting Judgment

Report what helps the user or reviewer evaluate the work:

- files or areas changed
- behavior changed
- checks run
- checks skipped and why
- deployment or migration notes
- ADR or doc updates
- residual risk
- useful next step

Small work can close with one concise paragraph. Larger work benefits from a
short structured summary.
