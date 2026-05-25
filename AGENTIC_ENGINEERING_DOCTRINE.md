# Generated Project Agent View

This is a single-file reference rendering of what an autonomous coding agent will see after this Copier template is applied to a new project.

It includes only files generated into the reference project, in the same orientation path used by generated `AGENTS.md`.

Generated from the current template repository contents.

Template repository: https://github.com/saulrichardson/agentic-engineering-template

Reference rendering notes:

- Project name: Reference Project
- Primary domain: Reusable agentic engineering guidance
- Cloud target: Undecided
- The generated project sections use reference values where project-specific answers are required.
- This file is a review artifact; generated projects receive the individual files shown below, not this combined file.


---

## Generated Project Operating Guide

_Source: `generated-project/AGENTS.md`_

# Agent Operating Guide

Project: Reference Project

This file is the root operating guide for autonomous coding agents working in
this repository. It is generated from the reusable agentic engineering template,
then owned by this project.

Project-specific guidance lives in `docs/project-profile.md` and durable project
records under `docs/records/`.

## North Star

Build useful, maintainable software with high agency and clear evidence.

Autonomous coding agents are trusted collaborators. They may inspect the
repository, choose an implementation path, refactor where it clarifies the work,
write tests, improve documentation, run checks, and prepare deployment.

```text
goal -> context -> decision -> implementation -> verification -> delivery notes
```

Prefer momentum with judgment. Add durable notes when the change is hard to
reverse, has broad blast radius, changes public behavior, touches production
data, or creates guidance future agents should inherit.

## Read Order

Before substantial work, read these files:

1. `AGENTS.md`
2. `docs/project-profile.md`
3. `docs/product-intent.md`
4. `docs/records/README.md`
5. `docs/engineering/agent-execution-protocol.md`
6. `docs/engineering/doctrine.md`
7. `docs/architecture/system-map.md`
8. Relevant project records in `docs/records/`

If the repository has implementation code, inspect the code before changing it.
Treat source files as current when they differ from docs, then update docs when
the difference matters for future work.

## Documentation Map

Use this map when you need context:

- `AGENTS.md`: root operating guide, read order, decision latitude, and expected
  coding-agent behavior.
- `README.md`: project overview, documentation set, repository workflow, and
  template update instructions.
- `docs/project-profile.md`: current project facts, stack choices, constraints,
  users, decision latitude, and open questions.
- `docs/product-intent.md`: rough product thinking, workflows, examples, and
  questions before they become implementation guidance.
- `docs/records/`: the single durable record system for decisions, caveats,
  stack rationale, risks, invariants, feature context, operating notes, and
  lessons learned.
- `docs/engineering/agent-execution-protocol.md`: practical work loop,
  instruction interpretation, change sizing, verification, and reporting.
- `docs/engineering/doctrine.md`: durable first-principles engineering guidance
  for autonomous coding-agent work.
- `docs/engineering/feature-development.md`: feature-planning walkthrough from
  intent through data, behavior, verification, and rollout.
- `docs/architecture/system-map.md`: placement guide for deciding where product
  behavior, tooling, data, side effects, observability, and deployment work
  belong.

## Project Snapshot

- domain: Reusable agentic engineering guidance
- frontend: Project choice
- backend domain core: Project choice
- workflow runtime: Project choice
- durable database: Project choice
- policy engine: Project choice
- cloud target: Undecided

Treat these as local defaults. Choose a better tool when the task and codebase
justify it. Update `docs/project-profile.md` for the current fact and add a
project record when future agents need the reasoning.

## Agent Autonomy

Coding agents may make ordinary engineering decisions directly:

- choose internal names, helper functions, and file organization
- add tests, scripts, fixtures, examples, and small docs updates
- refactor nearby code when it clarifies the requested change
- install or use project dependencies that fit the stack and task
- run formatters, tests, build commands, and local verification tools
- prepare deployment artifacts and operational notes

Some choices deserve a project record:

- public API shape
- database schema or migration strategy
- authorization or tenant model
- deployment architecture
- major framework, language, or cloud service choice
- irreversible production operation
- broad refactor that changes ownership boundaries
- caveat, risk, or lesson future agents should remember

Keep records short and decision-focused.

## Forward Operating Model

Prioritize the best forward-looking functionality and operating model for the
project. Align code, data, tests, docs, and deployment around that model.

Treat backward compatibility as an explicit product requirement rather than a
default. Preserve old behavior only when the current task, project profile,
public API commitment, migration plan, or project record makes that requirement
clear.

When the clean design changes an existing interface, data shape, command, or
workflow, make the new model coherent and update the affected callers,
fixtures, docs, tests, and deployment notes in the same direction. Prefer one
clear operating model over compatibility branches, hidden fallbacks, shims, or
parallel concepts that make future work messy.

## Work Loop

For meaningful work, follow this loop:

1. Orient
   Read the goal, project profile, product intent, nearby code, tests, relevant
   docs, and relevant project records.

2. Form a working theory
   Decide what the system is trying to do, where the change belongs, and what
   evidence will prove it works.

3. Implement with initiative
   Make the coherent change, including tests, docs, scripts, or refactors that
   help the result hold together.

4. Verify
   Run the narrowest useful checks first. Broaden verification when the change
   crosses public behavior, persistence, policy, workflows, deployment, or
   shared behavior.

5. Leave evidence
   Summarize what changed, what was checked, what decisions were made, and what
   remains open. Add or update a project record when the learning should persist.

## Evidence Over Assumption

Ground implementation decisions in repository artifacts:

- code
- tests
- schemas
- configs
- migrations
- logs
- docs
- project records
- representative data examples

Treat assumptions as working theories. Confirm them through code, tests, docs,
or small experiments when the result depends on them.

For nontrivial work, inspect both the relevant inputs and outputs. Passing tests
is strongest when the tests exercise the actual goal and execution path.

## Language And Tooling Guidance

Use `docs/project-profile.md` as the starting point for stack choices. Tooling
serves delivery, so choose the tool that makes the work clearer, safer, and
easier to maintain.

When substituting a language, framework, runtime, package manager, database,
queue, or cloud service, record:

- the boundary it owns
- why it fits this task
- how to build and test it
- how to deploy it
- how future agents should maintain it

Small local choices can live in the changed code or `docs/project-profile.md`.
Larger choices deserve a project record.

## Delivery And Deployment

Treat deployment as part of engineering.

When a task reaches delivery territory, identify:

- what is being released
- which users, services, workflows, or developer commands are affected
- which environment receives it first
- build command
- test command
- migration or data step
- configuration and secret requirements
- deploy command or pipeline
- rollback or mitigation path
- smoke check or operational signal

Run the steps available in the local environment. When a step depends on
credentials, production access, or external approvals, document the exact next
action and the evidence already gathered.

## Documentation Updates

Use one durable documentation pattern:

- `docs/project-profile.md` for current facts and concise project state
- `docs/product-intent.md` for rough product thinking
- `docs/records/` for durable decisions, caveats, risks, stack rationale,
  feature context, invariants, operating notes, and lessons learned

Keep documentation close to the decision. Prefer a short accurate record over a
large stale explanation.

## Final Response Shape

For completed work, report:

- what changed
- how it was verified
- decisions or records added
- deployment notes when relevant
- residual risk when it helps the next reviewer

Keep the response concise and specific.


---

## Generated Project README

_Source: `generated-project/README.md`_

# Reference Project

Reference rendering of the reusable agentic engineering guidance.

Domain: Reusable agentic engineering guidance

This repository follows the reusable agentic engineering guidance generated by
the `agentic-engineering-template` Copier template. The generated docs are now
owned by this project and should evolve with the product.

## What Exists Now

- `AGENTS.md`: root operating guide for autonomous coding agents
- `docs/project-profile.md`: current project facts, selected stack, constraints,
  decision latitude, and open questions
- `docs/product-intent.md`: rough product narrative, workflow ideas, examples,
  open questions, and notes
- `docs/records/`: durable project records for decisions, caveats, stack
  rationale, risks, invariants, feature context, operating notes, and lessons
  learned
- `docs/architecture/system-map.md`: placement guide for deciding where changes
  belong
- `docs/engineering/agent-execution-protocol.md`: practical agent work loop
- `docs/engineering/doctrine.md`: general agentic engineering doctrine
- `docs/engineering/feature-development.md`: feature development walkthrough
- `scripts/doctor.sh`: local documentation/template health check

## How To Work In This Repository

Start each meaningful slice by clarifying:

1. The user, task, or system goal the work should serve
2. The current code and docs that already express the idea
3. The product behavior or developer workflow that should change
4. The data, state, policy, side effects, or deployment path involved
5. The tests, checks, examples, or operational signals that prove the result
6. The project record future agents should inherit, when the learning matters

Then build the smallest coherent version that moves the project forward. Add
structure when a real boundary appears. Keep simple work simple.

## Current Stack Profile

- frontend: Project choice
- backend domain core: Project choice
- workflow runtime: Project choice
- durable database: Project choice
- policy engine: Project choice
- cloud target: Undecided

These are starting choices. Record meaningful deviations in
`docs/project-profile.md` and add a project record under `docs/records/` when
future agents need the reasoning.

## Agentic Delivery Model

Agents in this repository are expected to act with initiative:

- inspect the relevant code before changing it
- choose implementation paths that fit the project
- refactor nearby code when it improves the result
- add tests and scripts that make the behavior easier to trust
- update docs when the change creates reusable knowledge
- prepare deployment notes when the work reaches operations

The project values working software plus evidence. Evidence can be a test run,
manual check, screenshot, migration dry run, build output, trace, log, project
record, or direct explanation grounded in the repository.

## Suggested Implementation Layout

When application code is introduced, prefer a structure that makes ownership
easy to see:

```text
apps/
  frontend/
services/
  api/
  workers/
domain/
workflows/
policy/
migrations/
infra/
tools/
docs/
```

Adjust names and layers to match the actual product. The useful separation is:

- user-facing interface
- backend or service entry points
- domain behavior
- persistence and migrations
- background or workflow execution
- policy and permissions
- infrastructure and deployment
- operational tooling
- reusable documentation

## Template Updates

This project was generated with Copier. To check local documentation health:

```bash
scripts/doctor.sh
```

To pull future template improvements:

```bash
copier check-update
copier update
```

If the template source later moves to GitHub, update `_src_path` in
`.copier-answers.yml` before running `copier update`.

## Next Practical Step

The first useful product slice often looks like:

```text
user intent -> interface -> application command -> domain behavior -> durable result -> visible feedback
```

For a developer tool, the same idea becomes:

```text
developer goal -> command or script -> project state change -> verification output -> documented usage
```


---

## Generated Documentation Index

_Source: `generated-project/docs/README.md`_

# Documentation

This directory contains the reusable guidance and project-local records for
`Reference Project`.

## Read Order

1. `../AGENTS.md`
2. `project-profile.md`
3. `product-intent.md`
4. `records/README.md`
5. `engineering/agent-execution-protocol.md`
6. `engineering/doctrine.md`
7. `architecture/system-map.md`
8. Relevant project records in `records/`

## Ownership Model

The reusable guidance gives the project a starting point. The project owns the
generated files after creation.

Use `product-intent.md` for rough notes about what the product is trying to do.
Promote stable facts from that file into `project-profile.md`, project records,
tests, or code when implementation starts depending on them.

Use `records/` for durable project knowledge: decisions, caveats, stack
rationale, security assumptions, operating notes, feature context, invariants,
risks, and lessons learned.

## Practical Use

Small tasks can use these docs lightly. Read the relevant context, make the
change, verify it, and leave a concise explanation.

Larger tasks should name the goal, affected system area, verification plan,
deployment implication, and project record before the work spreads across many
files.


---

## Generated Project Profile

_Source: `generated-project/docs/project-profile.md`_

# Project Profile

Project: Reference Project

Reference rendering of the reusable agentic engineering guidance.

## Template Source

This project was generated with Copier from the reusable agentic engineering
template.

The durable template metadata is stored in `.copier-answers.yml`. Copier owns
that file. Update it manually when the template repository moves and `_src_path`
must change.

## Product Domain

- primary domain: Reusable agentic engineering guidance

## Primary Users

- <user or actor>

## Core Jobs

- <job the system helps users or developers accomplish>

## Agent Decision Latitude

Coding agents may make local implementation decisions directly when they improve
the goal and fit the surrounding code.

Use this section for standing latitude. Add a project record under
`docs/records/` when a decision affects:

- public API
- data model
- deployment model
- authorization or tenant model
- major framework or language choice
- long-lived operational workflow
- broad ownership boundary

## Tenant And Ownership Model

- tenant boundary:
- ownership model:
- sharing model:

## Data Sensitivity

- sensitive data classes:
- retention constraints:
- audit or review expectations:

## Selected Stack

- frontend: Project choice
- backend domain core: Project choice
- workflow runtime: Project choice
- durable database: Project choice
- policy engine: Project choice
- cloud target: Undecided

## Preferred Implementation Stack

Coding agents should treat this as the project-local preferred language and tool
profile for production code.

- frontend and UI code: Project choice
- backend/domain code: Project choice
- workflow code: Project choice
- persistence and migrations: Project choice plus project-selected migration
  tools
- policy code: Project choice
- repository automation: POSIX shell first, with another scripting language when
  it better serves maintainability

When the preferred stack fits poorly, choose the next best option that
accomplishes the goal. Record the boundary it owns, build/test commands,
deployment expectations, and maintenance owner when the choice matters beyond
the local change in `docs/records/`.

## Tooling

Record local compiler, package-manager, formatter, editor, bundler, test-runner,
and deployment CLIs here as they become real project dependencies.

| Tool | Purpose | Install command | Common command | Notes |
| --- | --- | --- | --- | --- |
|  |  |  |  |  |

## Local Doctrine Overrides

Unspecified.

When a project-specific decision intentionally changes the reusable guidance,
record the current rule here and put the reasoning in `docs/records/` when
future agents need the history.

## Project-Specific Constraints

Unspecified.

Use this section for constraints such as regulatory requirements, data residency,
tenant model, critical user workflows, third-party systems, deployment limits,
performance targets, or support commitments.

## Approval And Coordination

- actions that deserve explicit coordination:
- reviewer or decision owner:
- expected response path:
- operational handoff:

## External Systems

| System | Purpose | Data shared | Side effects | Owner |
| --- | --- | --- | --- | --- |
|  |  |  |  |  |

## Irreversible Or High-Blast-Radius Actions

- <action>

## Critical Invariants

- <invariant>

## First Vertical Slice

Define the first runnable product slice here before adding broad application
structure.

For an ordinary product feature:

```text
user intent -> interface -> application command -> domain behavior -> durable result -> visible feedback
```

For a developer tool:

```text
developer goal -> command or script -> project state change -> verification output -> documented usage
```

## Out Of Scope

- <out-of-scope item>

## Open Questions

- What is the first user-facing or developer-facing workflow?
- What data is the durable source of truth?
- What actions deserve explicit coordination?
- What external systems can the application touch?
- What should be observable from day one?


---

## Generated Product Intent

_Source: `generated-project/docs/product-intent.md`_

# Product Intent

This is the project-owned place for describing what the product is trying to
become.

Use it for raw thoughts, product narrative, desired functionality, workflow
ideas, constraints, examples, open questions, and notes that are still forming.

This file may be messy while the product is being understood. It should help
humans and coding agents see the goal behind the work.

## Raw Notes

Add unstructured thoughts here.

- <note>

## Product Narrative

What are we building, for whom, and why?

## Desired Functionality

What should the product let users or developers do?

## Users And Jobs

Who uses this system, and what job are they trying to get done?

## Core Workflows

What are the most important end-to-end workflows?

## Experience Principles

What should the product feel like to use?

What should be fast, obvious, forgiving, precise, or powerful?

## Boundaries And Non-Goals

What should stay out of scope?

What behavior would make the product confusing, unsafe, or untrustworthy?

## Examples

Representative examples, scenarios, sample inputs, sample outputs, or sketches:

- <example>

## Open Questions

- <question>

## Promote Stable Facts

When a note here becomes stable and important, move or summarize it into the
right durable artifact:

- `docs/project-profile.md` for concise project facts, constraints, users,
  stack choices, invariants, and decision latitude
- `docs/records/` for durable decisions, caveats, stack rationale, feature
  context, policy or ownership assumptions, state and workflow guidance,
  telemetry guidance, security or abuse-risk notes, deployment notes, and
  lessons learned

Coding agents may use this file to understand intent. Important behavior should
also appear in code, tests, project records, or the project profile when
implementation depends on it.


---

## Project Records

_Source: `generated-project/docs/records/README.md`_

# Project Records

Use this directory for durable project knowledge.

Project records are the one standard way to document decisions, caveats,
technical choices, constraints, risks, learned guidance, invariants, operating
notes, and feature context that future agents should inherit.

Create a record when the information is useful beyond the current task. Use a
short filename that starts with the date:

```text
YYYY-MM-DD-short-topic.md
```

Examples:

```text
2026-01-15-frontend-stack.md
2026-01-20-report-export-caveats.md
2026-02-03-billing-state-model.md
2026-02-10-production-deploy-notes.md
```

## Record Shape

```markdown
# <record title>

- date: YYYY-MM-DD
- status: draft | active | superseded
- kind: decision | caveat | stack | feature | invariant | risk | operation | learning
- owner: <person, team, or agent>

## Context

What prompted this record?

What facts from the project matter?

## Guidance

What should future agents know, choose, preserve, migrate, or revisit?

## Evidence

What code, tests, commands, examples, production signals, user feedback, or
constraints support this record?

## Consequences

What changes because of this record?

## Follow-Up

- <task, question, or owner>
```

## How To Use Records

Use records for anything durable:

- chosen technical stack and why
- caveats discovered during implementation
- meaningful product or domain decisions
- policy, permission, ownership, or tenant assumptions
- state, workflow, data, or telemetry guidance
- security or abuse-risk notes
- deployment or operating model notes
- lessons learned that should change future agent behavior

Keep records direct. A record should help the next agent make a better decision
without reading chat history.


---

## Agent Execution Protocol

_Source: `generated-project/docs/engineering/agent-execution-protocol.md`_

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

Durable choices deserve a note in `docs/project-profile.md` or
`docs/records/`:

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
   Read `AGENTS.md`, `docs/project-profile.md`, relevant project records,
   nearby code, tests, configs, and docs.

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
| Large | Persistence, deployment, security, public API, infrastructure, or broad refactor | focused plan, tests, migration/deploy notes, project record when durable |

Use the smallest process that gives the next reviewer confidence.

## Verification Bands

Match verification to risk:

- docs-only: inspect rendered structure and links
- UI: component check, screenshot, or browser smoke test
- domain behavior: unit, property, or scenario tests
- API: schema, handler, client, or contract tests
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
- project record or doc updates
- residual risk
- useful next step

Small work can close with one concise paragraph. Larger work benefits from a
short structured summary.


---

## Engineering Doctrine

_Source: `generated-project/docs/engineering/doctrine.md`_

# Engineering Doctrine

We build software with autonomous coding agents as high-agency collaborators.

The doctrine:

```text
Autonomous coding agents inspect, decide, implement, test, document, and prepare
delivery. Their work leaves evidence that future humans and agents can use:
clear intent, coherent changes, useful checks, deployment context, and durable
decisions.
```

This doctrine applies to ordinary web applications, APIs, databases,
infrastructure, workflows, internal tools, user interfaces, services, libraries,
and developer tooling.

## Goal-First Engineering

Start from the goal. Read the local project profile, product intent, existing
code, tests, docs, and recent decisions before choosing an approach.

Common patterns are useful hypotheses. The right solution is the one that serves
the stated goal, fits the current codebase, and leaves the system easier to
extend.

When a goal exposes a weak abstraction, reshape the abstraction when the change
is local and coherent. Record the decision when the new shape affects future
work.

## Agency With Evidence

Coding agents are expected to make engineering decisions. Good decisions leave a
trail:

- the problem being solved
- the code or docs changed
- the verification performed
- the operational or deployment consequence
- the local decision that future agents should inherit

Small choices belong in the implementation. Current project facts belong in
`docs/project-profile.md`. Durable context belongs in `docs/records/`.

## First-Class Change Rule

When a requirement introduces an important concept, represent it directly.

Important concepts often deserve names in one or more places:

- domain model
- type or schema
- API boundary
- state machine
- policy input
- database constraint
- workflow event
- test
- telemetry or audit event
- docs or project record

A future agent should be able to find the concept where the system actually
uses it.

## Coding-Agent Delivery Path

Coding-agent work follows this path:

```text
goal
  -> repository context
  -> working theory
  -> implementation choice
  -> code and documentation change
  -> tests or checks
  -> delivery notes
  -> project record or profile update when useful
```

The path keeps work tied to outcome and evidence. It scales down to a one-line
fix and up to architectural change.

## Product Behavior Path

Application behavior should stay legible from intent to consequence:

```text
user intent
  -> interface or entry point
  -> domain model
  -> policy or permission decision
  -> state or data change
  -> side effect when needed
  -> observable result
  -> deployment path
```

Every meaningful feature should know where it sits in this path.

## Decision Model

Agents may choose the local implementation path that best serves the goal.

Use lightweight judgment:

- local, reversible choices can happen in code
- shared behavior deserves tests and documentation
- hard-to-reverse choices deserve a project record
- operationally sensitive choices deserve deployment notes
- ambiguous product choices deserve a question or a small set of options

The project should become easier for the next agent to understand.

## State And Data Model

Important lifecycle changes should have explicit states, events, or data facts.

Useful shape:

```text
current facts + event + rules = next facts
```

When correctness depends on a fact, put that fact where the system can enforce
or observe it: type, schema, database constraint, transition function, test, or
telemetry event.

## Side Effects

Side effects include database writes, emails, uploads, external API calls,
payments, file writes, command execution, queue publishes, notifications, and
cloud resource changes.

Good side-effect work has:

- clear owner
- typed or documented input
- expected output or state change
- retry or failure behavior
- idempotency where useful
- audit or trace event for important effects

## Persistence

The durable source of truth should match the domain facts the product relies on.

Use database constraints and migrations to preserve facts that matter:

- foreign keys
- unique constraints
- non-null constraints
- check constraints
- constrained status values
- idempotency keys
- audit/event tables
- ownership relationships

When data shape changes, include the migration, verification command, and
rollback or mitigation story that fits the risk.

## Workflows

Long-running, failure-prone, multi-step work belongs in a recoverable execution
model.

Use workflows or equivalent orchestration for:

- approval flows
- document processing
- external API orchestration
- scheduled operations
- retries and compensation
- human-in-the-loop work
- multi-step deployment or data operations

The work should be explainable after an interruption.

## Observability

Important behavior should be reconstructable.

The system should be able to answer:

- what goal or user intent started this?
- what code, state, or context was involved?
- what decision was made?
- what state or data changed?
- what side effect occurred?
- what failed or retried?
- what tests or checks support the change?
- what was recorded for review or operation?

Use structured logs, traces, metrics, audit events, and stable correlation IDs.
Keep telemetry useful, focused, and respectful of sensitive data.

## Documentation

Documentation is part of delivery when it preserves useful context.

Use:

- `docs/product-intent.md` for rough product thinking
- `docs/project-profile.md` for local facts and stack decisions
- `docs/records/` for durable decisions, caveats, stack rationale, feature
  context, invariants, risks, security assumptions, operating notes, and lessons
  learned

Docs can be short. Accuracy and placement matter more than length.

## Practical Example

A request says: "Add team invitations."

A high-agency implementation path:

1. Read product intent, project profile, auth code, existing user/team models,
   tests, and deployment scripts.
2. Decide where invitations belong in the domain model.
3. Add invitation states such as `pending`, `accepted`, and `expired` when they
   matter to behavior.
4. Add database constraints for team ownership and invitation uniqueness.
5. Add API or command handling that matches existing conventions.
6. Add side-effect handling for email or notification delivery when needed.
7. Add tests for valid invite, expired invite, duplicate invite, and permission
   behavior.
8. Add telemetry or audit events if the project needs operational visibility.
9. Record any new architecture, policy, or deployment decision in
   `docs/records/` when future agents need the reasoning.

The exact technology is local. The enduring idea is that the feature becomes
visible, testable, deployable, and understandable.


---

## System Map

_Source: `generated-project/docs/architecture/system-map.md`_

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


---

## Feature Development Guide

_Source: `generated-project/docs/engineering/feature-development.md`_

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
