# Agentic Engineering Guide

This is a single-file reader artifact assembled from the reusable agentic engineering template.

It is meant to be passed to someone who needs one coherent artifact rather than a repository tree.

Generated from the current template repository contents.

Template repository: https://github.com/saulrichardson/agentic-engineering-template

Reference rendering notes:

- Project name: Reference Project
- Primary domain: Reusable agentic engineering guidance
- Cloud target: Undecided
- The generated project sections use reference values where project-specific answers are required.
- Technical setup and Copier mechanics are intentionally placed at the end.


---

## Pedagogical Overview

_Source: `README.md`, before `## Template Mechanics`._

# Agentic Engineering Template

This repository is a Copier template for starting software projects that will be
planned, built, tested, documented, and shipped with autonomous coding agents.

It provides documentation rather than application scaffold code. It gives each
new project a local operating guide, project profile, product-intent space,
engineering doctrine, architecture map, decision-record structure, and practical
templates that help coding agents act with context and judgment.

The purpose is high-agency engineering:

```text
Autonomous coding agents are collaborators with initiative.
They inspect, decide, implement, test, document, and prepare delivery.
Their work leaves evidence: clear intent, coherent changes, useful checks,
deployment context, and decisions that future agents can understand.
```

The template is product-domain independent. It works for web apps, APIs,
infrastructure, internal tools, databases, user interfaces, workflows, libraries,
and services. Application-embedded agent guidance belongs in a separate
documentation set; this template focuses on coding agents working in a
repository.

## Why This Exists

Autonomous coding agents can move faster than the surrounding project context.
The useful response is to make the project easier to understand and change.

Good agentic projects give agents:

- a clear product goal
- an explicit local stack profile
- visible domain concepts
- a map from user intent to shipped behavior
- lightweight decision records
- practical verification expectations
- deployment and operational context
- room to choose the implementation path that best serves the goal

The template favors momentum with evidence. Agents are free to make local
engineering decisions, reshape code, add tests, improve docs, and prepare
deployment when the repository context supports that work. Larger choices become
durable through project-profile updates or ADRs so future agents inherit the
reasoning.

## Primary Audience

The primary audience is autonomous coding agents and the humans collaborating
with them.

Coding agents write, modify, test, review, document, and deliver the codebase.
They need principles that scale across domains while leaving space for local
judgment. These docs are guiding principles for that judgment.

## What This Template Teaches

The generated documentation trains agents to work from outcome to evidence:

```text
goal
  -> repository context
  -> working theory
  -> implementation choice
  -> code and documentation change
  -> tests or checks
  -> delivery notes
  -> durable decision record when useful
```

For product behavior, the project stays legible by keeping the path from intent
to consequence visible:

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

The point is a codebase that remains easy for future agents to extend because
the important ideas have names, homes, tests, and
operational context.

## The Core Mental Model

The generated project docs are organized around one mental model:

```text
software whose intent stays legible to autonomous coding agents
```

That means:

- agents start from the goal and inspect the current repository
- implementation choices serve the product and the existing codebase
- important concepts appear in code, docs, tests, or ADRs
- verification matches the actual risk and blast radius
- deployment work is a first-class part of engineering
- small tasks stay lightweight
- durable decisions are recorded where future agents will find them
- the project profile explains local stack and domain choices
- product intent has a place to be messy before it becomes implementation

The stack can change. The local reasoning should stay discoverable.

## How A Project Should Use The Generated Docs

Each generated project gets local, editable files. The project owns them.

Generated projects should use the docs in this order:

1. `AGENTS.md`
2. `docs/project-profile.md`
3. `docs/product-intent.md`
4. `docs/engineering/agent-execution-protocol.md`
5. `docs/engineering/definition-of-done.md`
6. `docs/engineering/doctrine.md`
7. `docs/architecture/system-map.md`
8. `docs/architecture/stack-profile.md`
9. Relevant contracts in `docs/contracts/`
10. Relevant threat model in `docs/security/`
11. Relevant ADRs in `docs/adr/`
12. Relevant templates in `docs/templates/`

`AGENTS.md` is the root operating guide for future coding agents.
`docs/project-profile.md` records local facts, stack choices, decision latitude,
constraints, users, external systems, and open questions.
`docs/product-intent.md` is a freeform working area for goals, workflows,
examples, questions, and rough product thinking.
`docs/architecture/stack-profile.md` records preferred implementation tools and
the substitution logic agents use when another tool better serves the task.
ADRs record decisions that future agents might otherwise question or undo.

## What Gets Generated

A generated project receives this documentation set:

```text
AGENTS.md
README.md
.copier-answers.yml
.gitignore
docs/
  README.md
  project-profile.md
  product-intent.md
  engineering/
    agent-execution-protocol.md
    definition-of-done.md
    doctrine.md
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
    state-machine.md
scripts/
  doctor.sh
```

The generated docs are starting material. Projects adapt them locally as the
product becomes real.

## Why Copier

Copier gives the right ownership model:

- generated projects get real local files
- each project answers its own stack and domain questions
- `.copier-answers.yml` records the template source, version, and answers
- future template improvements can be pulled with `copier update`
- local project decisions appear in normal Git diffs

In short:

```text
template repo = reusable guidance source
generated project = local truth
```

## How To Evolve The Doctrine

Changes to this template should improve broadly reusable guidance for coding
agents.

Strong template changes include:

- clearer first-principles explanations
- better project-profile prompts
- better feature planning questions
- better ADR prompts
- sharper agent execution guidance
- more useful verification and deployment walkthroughs
- simpler generated project structure
- improved Copier validation

Project-specific business terminology, stack commitments, and implementation
details belong in generated projects. Promote a local decision back into this
template when it has clear value across many repositories.



---

## Generated Project Operating Guide

_Source: `generated-project/AGENTS.md`_

# Agent Operating Guide

Project: Reference Project

This file is the root operating guide for autonomous coding agents working in
this repository. It is generated from the reusable agentic engineering template,
then owned by this project.

Project-specific decisions override the base guidance when they are recorded in
`docs/project-profile.md` or an ADR under `docs/adr/`.

## North Star

Build useful, maintainable software with high agency and clear evidence.

Autonomous coding agents are trusted collaborators. They may inspect the
repository, choose an implementation path, refactor where it clarifies the work,
write tests, improve documentation, run checks, and prepare deployment.

```text
goal -> context -> decision -> implementation -> verification -> delivery notes
```

Prefer momentum with judgment. Add ceremony when the change is hard to reverse,
has broad blast radius, changes public behavior, touches production data, or
creates a decision future agents will need to understand.

## Read Order

Before substantial work, read these files:

1. `AGENTS.md`
2. `docs/project-profile.md`
3. `docs/product-intent.md`
4. `docs/engineering/agent-execution-protocol.md`
5. `docs/engineering/definition-of-done.md`
6. `docs/engineering/doctrine.md`
7. `docs/architecture/system-map.md`
8. `docs/architecture/stack-profile.md`
9. Relevant contract docs in `docs/contracts/`
10. Relevant threat model, feature brief, ADR, or local module documentation

If the repository has implementation code, inspect the code before changing it.
Treat source files as current when they differ from docs, then update docs when
the difference matters for future work.

## Documentation Map

Use this map when you need a specific kind of guidance:

- `AGENTS.md`: root operating guide, read order, decision latitude, and
  expected coding-agent behavior.
- `README.md`: project overview, documentation set, repository workflow, and
  template update instructions.
- `docs/project-profile.md`: project-local facts, stack choices, decision
  latitude, users, tenant model, sensitive data, external systems, irreversible
  actions, critical invariants, and open questions.
- `docs/product-intent.md`: freeform product narrative and raw notes about what
  the product should do, who it serves, desired workflows, examples, non-goals,
  and questions before they become formal decisions.
- `docs/engineering/agent-execution-protocol.md`: practical work loop,
  instruction interpretation, change sizing, verification, and reporting.
- `docs/engineering/definition-of-done.md`: completion criteria for behavior,
  tests, docs, deployment notes, and residual risk.
- `docs/engineering/doctrine.md`: durable first-principles engineering doctrine
  for autonomous coding-agent work.
- `docs/engineering/feature-development.md`: feature-planning walkthrough from
  intent through data, behavior, verification, and rollout.
- `docs/engineering/deployment-readiness.md`: deployment readiness checklist for
  environments, data, secrets, observability, rollback, and operation.
- `docs/engineering/formal-methods.md`: advanced verification options for
  critical invariants and subtle state spaces.
- `docs/architecture/system-map.md`: coding-agent delivery path, product
  behavior path, layer responsibilities, common objects, and design signals.
- `docs/architecture/stack-profile.md`: selected implementation tools,
  substitution rules, and when to add a new layer.
- `docs/contracts/README.md`: index for durable system contracts that other
  code, agents, workflows, tools, policies, or integrations depend on.
- `docs/contracts/state-machines.md`: lifecycle states, events, guards,
  terminal states, transition ownership, and test expectations.
- `docs/contracts/tool-registry.md`: external integration and side-effect
  capabilities, including inputs, outputs, owners, timeouts, idempotency, and
  audit events.
- `docs/contracts/workflow-events.md`: workflow event names, retry semantics,
  idempotency behavior, and failure handling.
- `docs/contracts/policy-inputs.md`: authority dimensions, policy decision
  inputs, allow/deny results, and policy audit events.
- `docs/contracts/telemetry-events.md`: trace, metric, log, and audit event
  names needed to reconstruct important behavior.
- `docs/security/threat-model.md`: security and abuse-risk questions for coding
  agent access, product behavior, data, credentials, deployment, and operations.
- `docs/adr/README.md`: when to write architecture decision records and what
  decisions benefit from durable explanation.
- `docs/templates/`: reusable briefs for ADRs, features, agent tasks, threat
  models, and state machines.

## Project Snapshot

- domain: Reusable agentic engineering guidance
- frontend: Project choice
- backend domain core: Project choice
- workflow runtime: Project choice
- durable database: Project choice
- policy engine: Project choice
- cloud target: Undecided

Treat these as local defaults. Choose a better tool when the task and codebase
justify it, then record the reason in `docs/project-profile.md` or an ADR when
the decision affects future work.

## Agent Autonomy

Coding agents may make ordinary engineering decisions directly:

- choose internal names, helper functions, and file organization
- add tests, scripts, fixtures, examples, and small docs updates
- refactor nearby code when it clarifies the requested change
- install or use project dependencies that already fit the stack
- run formatters, tests, build commands, and local verification tools
- prepare deployment artifacts and operational notes

Some choices deserve durable explanation:

- public API shape
- database schema or migration strategy
- authorization or tenant model
- deployment architecture
- major framework, language, or cloud service choice
- irreversible production operation
- broad refactor that changes ownership boundaries

Use ADRs for those choices. Keep ADRs short and decision-focused.

## Work Loop

For meaningful work, follow this loop:

1. Orient
   Read the goal, project profile, product intent, nearby code, tests, and
   relevant docs.

2. Form a working theory
   Decide what the system is trying to do, where the change belongs, and what
   evidence will prove it works.

3. Implement with initiative
   Make the coherent change, including tests, docs, scripts, or refactors that
   help the result hold together.

4. Verify
   Run the narrowest useful checks first. Broaden verification when the change
   crosses public behavior, persistence, policy, workflows, deployment, or
   shared contracts.

5. Leave evidence
   Summarize what changed, what was checked, what decisions were made, and what
   remains open.

## Evidence Over Assumption

Ground implementation decisions in repository artifacts:

- code
- tests
- schemas
- configs
- migrations
- logs
- docs
- ADRs
- contract files
- representative data examples

Treat assumptions as working theories. Confirm them through code, tests, docs,
or small experiments when the result depends on them.

For nontrivial work, inspect both the relevant inputs and outputs. Passing tests
is strongest when the tests exercise the actual goal and execution path.

## Language And Tooling Guidance

Use `docs/architecture/stack-profile.md` as the starting point. Tooling serves
delivery, so choose the tool that makes the work clearer, safer, and easier to
maintain.

When substituting a language, framework, runtime, package manager, database,
queue, or cloud service, record:

- the boundary it owns
- why it fits this task
- how to build and test it
- how to deploy it
- how future agents should maintain it

Small local choices can live in the changed code or `docs/project-profile.md`.
Larger choices deserve an ADR.

## Delivery And Deployment

Treat deployment as part of engineering.

When a task reaches delivery territory, identify:

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

Update docs when the change creates knowledge future agents need:

- `docs/project-profile.md` for local facts, stack choices, constraints, and
  decision latitude
- `docs/product-intent.md` for product ideas, examples, open questions, and
  rough workflows
- `docs/architecture/system-map.md` for meaningful changes to system shape
- `docs/contracts/` for shared states, policies, workflows, side effects, or
  telemetry events
- `docs/security/threat-model.md` for security-sensitive access or behavior
- `docs/adr/` for durable choices future agents might question

Keep documentation close to the decision. Prefer a short accurate update over a
large stale explanation.

## Final Response Shape

For completed work, report:

- what changed
- how it was verified
- decisions recorded or left open
- deployment notes when relevant
- residual risk when it helps the next reviewer

Keep the response concise and specific.


---

## Generated Documentation Index

_Source: `generated-project/docs/README.md`_

# Documentation

This directory contains the reusable guidance and project-local decisions for
`Reference Project`.

## Read Order

1. `../AGENTS.md`
2. `project-profile.md`
3. `product-intent.md`
4. `engineering/agent-execution-protocol.md`
5. `engineering/definition-of-done.md`
6. `engineering/doctrine.md`
7. `architecture/system-map.md`
8. `architecture/stack-profile.md`
9. Relevant contracts in `contracts/`
10. Relevant threat model in `security/`
11. Relevant ADRs in `adr/`
12. Relevant templates in `templates/`

## Ownership Model

The reusable guidance gives the project a strong starting point. The project
owns the generated files after creation.

Use `product-intent.md` for rough notes about what the product is trying to do.
Promote stable facts from that file into `project-profile.md`, contracts,
feature briefs, ADRs, tests, or code when implementation starts depending on
them.

Use ADRs when a local decision changes architecture, persistence, public API,
deployment strategy, major tooling, security posture, or another choice future
agents will reasonably question.

## Practical Use

Small tasks can use these docs lightly. Read the relevant context, make the
change, verify it, and leave a concise explanation.

Larger tasks should name the goal, affected system area, verification plan,
deployment implication, and decision record before the work spreads across many
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

Record decisions here or in an ADR when they affect:

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
the local change.

## Tooling

Record local compiler, package-manager, formatter, editor, bundler, test-runner,
and deployment CLIs here as they become real project dependencies.

| Tool | Purpose | Install command | Common command | Notes |
| --- | --- | --- | --- | --- |
|  |  |  |  |  |

## Local Doctrine Overrides

Unspecified.

When a project-specific decision intentionally changes the reusable guidance,
record it here briefly and add an ADR under `docs/adr/` when future agents need
the reasoning.

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
- `docs/templates/feature-brief.md` for a specific feature before implementation
- `docs/adr/` for architecture, stack, policy, persistence, workflow, or
  deployment decisions
- `docs/contracts/` for state machines, policy inputs, integration
  capabilities, workflow events, and telemetry events
- `docs/security/threat-model.md` for security and abuse-risk assumptions

Coding agents may use this file to understand intent. Important behavior should
also appear in code, tests, contracts, feature briefs, ADRs, or the project
profile when implementation depends on it.


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


---

## Definition Of Done

_Source: `generated-project/docs/engineering/definition-of-done.md`_

# Definition Of Done

Done means the goal is satisfied and the project has enough evidence to trust
the result.

Use this definition with judgment. A typo fix needs little ceremony. A schema,
security, deployment, or public behavior change needs stronger proof.

## Core Completion Criteria

A change is done when:

- the requested outcome works in the current repository
- the implementation fits the surrounding code and project profile
- relevant tests, builds, checks, or inspections have been run
- docs or ADRs are updated when future agents need the context
- deployment, migration, or operational consequences are known
- the final report states what changed and how it was verified

## Behavior

For behavior changes, confirm:

- the main success path works
- important edge cases are handled
- errors are explicit and useful
- public interfaces match callers or documented contracts
- state and data changes are represented in the natural system layer

## Verification

Verification can include:

- automated tests
- type checks
- lint or format checks
- build commands
- migration dry runs
- local browser or CLI smoke checks
- manual inspection of generated output
- logs, traces, or screenshots
- small reproducible examples

The best verification exercises the path that matters to the task.

## Documentation

Update documentation when the change creates durable knowledge:

- new product behavior
- new command or workflow
- new dependency or stack choice
- new data shape or migration rule
- new deployment requirement
- new security or operational assumption
- new decision future agents may question

Keep docs concise and close to the decision.

## Delivery

For deployment-facing changes, include:

- build command
- test command
- required environment variables
- migration or data step
- deploy command or pipeline
- smoke check
- rollback or mitigation path

When credentials or production access are required, record the exact handoff and
the evidence already gathered.


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

Small choices belong in the implementation. Durable choices belong in
`docs/project-profile.md` or an ADR.

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
- integration capability
- test
- telemetry or audit event
- docs or ADR

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
  -> ADR or profile update when useful
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
- hard-to-reverse choices deserve an ADR
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

Use `docs/contracts/tool-registry.md` when an integration or side-effect
capability becomes shared or operationally important.

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
- `docs/contracts/` for shared behavior surfaces
- `docs/templates/feature-brief.md` for meaningful feature planning
- `docs/adr/` for durable choices future agents may question
- `docs/security/threat-model.md` for sensitive access, data, or operations

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
9. Record any new architecture, policy, or deployment decision in the right doc.

The exact technology is local. The enduring idea is that the feature becomes
visible, testable, deployable, and understandable.


---

## System Map

_Source: `generated-project/docs/architecture/system-map.md`_

# System Map

This map describes how work moves from goal to shipped behavior. It covers
development-time work done by autonomous coding agents and ordinary runtime
behavior inside the product.

## Coding-Agent Delivery Path

Coding-agent work should follow this path:

```text
goal
  -> repository context
  -> working theory
  -> implementation choice
  -> code and documentation change
  -> tests or checks
  -> delivery notes
  -> ADR or profile update when useful
```

This path keeps autonomous work tied to outcome and evidence. The exact amount
of process scales with blast radius.

## Product Behavior Path

Every meaningful feature should be understood across the product path:

```text
user intent
  -> interface or entry point
  -> application command
  -> domain behavior
  -> policy or permission decision
  -> durable data
  -> workflow or background work when useful
  -> external side effect when useful
  -> observable result
  -> deployment path
```

Developer tooling follows the same pattern:

```text
developer goal
  -> command or script
  -> project state change
  -> verification output
  -> documented usage
```

## Common Project Objects

Serious systems often benefit from first-class objects like:

- `UserIntent`
- `Command`
- `DomainEvent`
- `StateTransition`
- `PolicyDecision`
- `WorkflowRun`
- `SideEffect`
- `AuditEvent`
- `IdempotencyKey`
- `Deployment`
- `HealthCheck`

These names are examples. The principle is that meaningful concepts should be
visible in code and data.

## Layer Responsibilities

### Interface

The interface captures user or developer intent and represents system state. It
guides the actor and translates actions into commands.

### Entry Point

An entry point can be an API handler, CLI command, job, webhook, worker, or UI
action. It parses input, authenticates when needed, and calls the application or
domain layer.

### Domain Model

The domain model defines the meaningful facts, objects, rules, and transitions.
Important product rules should have a stable home here.

### Policy

Policy answers what an actor, service, workflow, or tool may do. It should be
explicit enough to test and operate.

### State And Persistence

Important lifecycle changes should pass through clear transition logic. The
database or durable store records facts the product relies on and enforces
constraints where practical.

### Workflow

Workflows coordinate long-running, retryable, externally dependent, or
human-coordinated work. They make waiting, retries, compensation, and final
state visible.

### Side-Effect Capability

A side-effect capability mutates the world outside the current process:
external API, email, file write, payment, command execution, cloud mutation,
queue publish, or notification.

Shared side-effect capabilities should have clear inputs, outputs, owner,
timeout, idempotency behavior, and observability.

### Observability

Telemetry reconstructs behavior across tasks, requests, workflows, policy
decisions, side effects, database changes, deployments, tests, and audit events.

## Redesign Signals

Use these signals to consider a clearer design:

- a coding agent needs unrelated files to understand one behavior
- the same rule appears in several layers
- lifecycle status changes from many places
- side effects happen with unclear retry or failure behavior
- authorization logic differs by entry point
- migrations change ownership or invariants with missing durable explanation
- workflow state is hard to resume or explain after failure
- production behavior is difficult to reconstruct from records and telemetry
- deployment steps live only in memory or chat history


---

## Stack Profile

_Source: `generated-project/docs/architecture/stack-profile.md`_

# Stack Profile

This is the stack profile for `Reference Project`. It records this project's
selected tools and gives coding agents permission to choose better local tools
when the work calls for them.

## Project Choices

| Concern | Project choice | What agents should consider |
| --- | --- | --- |
| Frontend | Project choice | UI state, accessibility, interaction model, build pipeline |
| Backend domain core | Project choice | domain clarity, tests, package ecosystem, deployment target |
| Workflow runtime | Project choice | retries, scheduling, background work, recoverability |
| Durable database | Project choice | constraints, migrations, transactions, local tooling |
| Policy | Project choice | permissions, tenant ownership, auditability, testability |
| Build and release | Project choice | reproducible commands, CI, artifacts, provenance |
| Observability | Project choice | logs, traces, metrics, audit events, health checks |
| Cloud | Undecided | operational fit, deployment ergonomics, cost, permissions |

## Implementation Language Guidance

The selected stack is the starting point for coding agents:

- frontend and UI code: Project choice
- backend/domain code: Project choice
- workflow code: Project choice
- persistence and migrations: Project choice plus project-selected migration
  tools
- policy code: Project choice
- repository automation: POSIX shell first, with another scripting language when
  it makes the automation clearer

Tooling serves delivery. A selected language may need a package manager,
runtime, bundler, formatter, or language server written in another ecosystem.
Use the tooling that makes the project easier to build, test, and maintain.

When choosing a substitute language or major tool, record:

- what boundary it owns
- why it fits the task
- package manager and dependency policy
- test and CI commands
- deployment path
- maintenance owner
- replacement or rollback story when useful

## Substitution Principle

A technology choice is good when it improves the project properties that matter:

- clear domain model
- readable implementation
- fast local feedback
- strong tests or checks
- simple deployment
- understandable operations
- maintainable dependencies
- observable behavior
- durable decision trail

Agents may choose a different tool when it better serves those properties.
Record durable changes in `docs/project-profile.md` or an ADR.

## Backward Compatibility

Backward compatibility is a product decision.

Preserve compatibility when the project profile, an ADR, a public API
commitment, a migration plan, or the current task requires it. When the cleanest
design changes a contract, record the migration, rollout, or replacement path
that fits the risk.

## Stack Serves Architecture

Architecture is the shape of the system more than the brand of the tools:

```text
intent -> command -> domain behavior -> durable result -> observable outcome
```

Keep that model visible even as the stack evolves.

## When To Add A Layer

Add a layer when it helps the product:

- add policy when permissions become meaningful
- add workflows when work is long-running, retryable, or externally dependent
- add deep verification when an invariant is critical and subtle
- add infrastructure automation when manual setup becomes repetitive
- add shared integration boundaries when side effects spread
- add observability when behavior needs operational reconstruction

## Early Vertical Slice

The first runnable slice often looks like:

```text
user intent
  -> interface or entry point
  -> domain behavior
  -> Project choice record
  -> visible feedback
  -> log, trace, or audit event
```

Build that slice first, then add layers as the product surface proves the need.


---

## Feature Development Guide

_Source: `generated-project/docs/engineering/feature-development.md`_

# Feature Development Guide

Use this guide before building meaningful features. The goal is to help coding
agents move from product intent to working software while preserving the core
idea.

Small features can answer these questions quickly. Large features can use
`docs/templates/feature-brief.md`.

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
- relevant ADRs
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

Important concepts should become visible in code, tests, docs, or contracts.

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
- what compatibility or migration path exists for current data?

Use `docs/contracts/state-machines.md` when lifecycle behavior becomes shared or
important.

## 7. Define Authority

Ask:

- who can perform the action?
- what context affects the decision?
- what ownership or tenant boundary applies?
- what audit or review event should exist?

Use `docs/contracts/policy-inputs.md` when policy becomes shared across modules,
services, or workflows.

## 8. Define Side Effects

Ask:

- what external systems are touched?
- what happens after partial failure?
- what can be retried?
- what should be idempotent?
- what timeout or failure state is useful?

Use `docs/contracts/tool-registry.md` when an integration becomes a shared
capability.

## 9. Define Observability

Ask:

- what event proves the feature happened?
- what identifier connects user action, data change, and side effect?
- what logs or metrics help operate it?
- what audit event helps reconstruct important behavior?

Use `docs/contracts/telemetry-events.md` for shared event names.

## 10. Verify And Ship

Choose checks that prove the feature:

- unit or domain tests for rules
- integration tests for boundaries
- migration checks for data
- UI or browser checks for user flows
- workflow or worker tests for retries and failure paths
- build and deploy checks for release readiness

Then update docs or ADRs where future agents need the decision.


---

## Deployment Readiness

_Source: `generated-project/docs/engineering/deployment-readiness.md`_

# Deployment Readiness

Deployment is part of engineering. Use this guide when a change affects release,
runtime configuration, infrastructure, data, background work, or operations.

## Release Shape

Describe:

- what is being released
- which users, services, or workflows are affected
- which environment receives it first
- how success will be observed
- how the team returns to a stable state if needed

## Build And Test

Record the commands:

- install dependencies:
- format or lint:
- type check:
- unit tests:
- integration tests:
- build:
- smoke test:

Run the commands available in the local environment and capture blockers for the
remaining ones.

## Configuration And Secrets

List:

- required environment variables
- secret names and owners
- config files
- feature flags
- service accounts
- external endpoints

Confirm that local, staging, and production expectations are visible to future
agents.

## Data And Migrations

For data changes, record:

- migration command
- expected data volume
- backfill or cleanup step
- compatibility expectation
- rollback or mitigation path
- verification query or check

## Infrastructure

For infrastructure changes, record:

- provider or platform
- plan/diff command
- apply/deploy command
- state storage
- permissions needed
- rollback or replacement path
- owner for follow-up operations

## Observability

Before release, identify:

- logs to inspect
- metrics to watch
- traces or audit events to query
- health check or smoke test
- alert that should fire on failure

## Handoff

A deployment-facing final report should include:

- what changed
- what was verified
- what command deploys it
- what config or secrets are required
- what migration or data step exists
- what smoke check confirms success
- what rollback or mitigation path exists


---

## Deep Verification Guidance

_Source: `generated-project/docs/engineering/formal-methods.md`_

# Deep Verification

Use deep verification when ordinary tests leave important uncertainty.

This file covers property tests, model-based tests, state-machine tests,
lightweight specs, model checking, and proof-oriented tools. The project can use
any technique that clarifies the invariant and gives future agents better
feedback.

## When To Reach For It

Deep verification is useful for:

- money movement
- authorization and ownership
- concurrency
- idempotency
- migrations that preserve invariants
- workflow retries and compensation
- scheduling
- distributed state
- data transformations with subtle edge cases

## Useful Techniques

- table-driven tests for known cases
- property tests for broad input spaces
- state-machine tests for lifecycle behavior
- model-based tests for implementation/spec agreement
- lightweight written specs for algorithms or protocols
- TLA+, Alloy, or similar model checking for concurrent workflows
- Dafny, Lean, Coq, or similar tools for proof-worthy invariants

Choose the smallest technique that makes the risk easier to reason about.

## How To Document A Deep Check

Record:

- invariant being protected
- model or property being tested
- command to run it
- relationship between the model and production code
- known limits of the check
- owner for keeping it useful

Place durable notes in the relevant contract, feature brief, or ADR.


---

## Contract Catalog

_Source: `generated-project/docs/contracts/README.md`_

# System Contracts

System contracts are durable notes for behavior that other code, agents,
workflows, tools, policies, or operators depend on.

Use these files when a behavior becomes shared, risky, operationally important,
or easy for future agents to misread.

## Contract Files

- `state-machines.md`: lifecycle states, events, guards, terminal states, and
  transition ownership
- `tool-registry.md`: external integrations and side-effect capabilities
- `workflow-events.md`: durable workflow events, retries, idempotency, and
  failure behavior
- `policy-inputs.md`: policy inputs, authority dimensions, decisions, and audit
  events
- `telemetry-events.md`: traces, metrics, logs, audit events, and correlation
  identifiers

## When To Add A Contract

Add or update a contract when:

- several modules depend on the same behavior
- a state change needs a clear lifecycle
- an integration mutates external systems
- a workflow crosses process or time boundaries
- a permission decision affects user trust or data access
- an operational event helps reconstruct production behavior

Contracts should be short and useful. They give future agents enough structure
to make confident changes.


---

## State Machine Contracts

_Source: `generated-project/docs/contracts/state-machines.md`_

# State Machine Contracts

Use this file for important lifecycle behavior.

State machines help agents understand which states exist, which events move
between them, and which rules protect the transition.

## Registry

| Machine | Entity | States | Events | Owner | Tests |
| --- | --- | --- | --- | --- | --- |
| Example invitation lifecycle | `Invitation` | `pending`, `accepted`, `expired`, `revoked` | `InviteSent`, `InviteAccepted`, `InviteExpired`, `InviteRevoked` | domain service | transition tests |

## Core Details

For each lifecycle, record:

- entity or aggregate
- allowed states
- allowed events
- transition owner
- guards or permissions
- terminal states
- retry or idempotency behavior
- persistence representation
- tests that prove the important transitions

## Transition Shape

Useful transition shape:

```text
current state + event + facts + policy = next state or rejection
```

## Implementation Notes

Keep lifecycle changes easy to find. A transition function, domain service, or
workflow step should own each important state change.


---

## Integration And Side-Effect Capability Catalog

_Source: `generated-project/docs/contracts/tool-registry.md`_

# Integration And Side-Effect Capability Catalog

Use this catalog for shared integrations or side-effect capabilities.

A capability is any reusable way to mutate the world or depend on an external
system: email, payment, file write, external API, command execution, queue
publish, notification, cloud mutation, or data export.

## Registry

| Capability | Purpose | Input | Output | Owner | Side effect | Idempotency | Timeout | Observable event | Failure states |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| `sendInvitationEmail` | Notify an invited user | `InvitationEmailInput` | delivery result | notifications worker | email send | invitation id | 10s | `invitation_email_sent` | failed, bounced |
| `syncCustomerRecord` | Update CRM copy of customer data | `CustomerSyncInput` | sync result | integrations worker | external API write | customer id + version | 30s | `customer_sync_completed` | failed, skipped |

## Core Capability Fields

For each capability, define:

- purpose
- typed or documented input
- output or result state
- owner
- permission or policy expectation
- side effect
- idempotency behavior
- timeout
- observable event
- failure states

## Capability Guidance

Shared capabilities should be narrow enough to reason about and broad enough to
replace repeated one-off integrations. When a capability is high impact, pair it
with tests, operational notes, and a threat-model entry.


---

## Workflow Event Contracts

_Source: `generated-project/docs/contracts/workflow-events.md`_

# Workflow Event Contracts

Use this file for durable workflow events.

Workflow events help agents understand long-running work, retries,
compensation, human coordination, and externally dependent steps.

## Registry

| Workflow | Event | Payload | Idempotency key | Success behavior | Failure behavior |
| --- | --- | --- | --- | --- | --- |
| `InvitationWorkflow` | `InvitationCreated` | invitation id, team id, email | invitation id | enqueue notification | mark notification pending |
| `InvitationWorkflow` | `InvitationEmailSent` | invitation id, provider id | invitation id + provider id | mark sent | retry or surface failure |
| `BillingSyncWorkflow` | `CustomerSynced` | customer id, version | customer id + version | record sync point | retry with backoff |

## Core Fields

For each event, record:

- workflow name
- event name
- payload shape
- idempotency key
- retry behavior
- timeout or deadline
- success behavior
- failure behavior
- emitted telemetry or audit event

## Guidance

Workflow history should explain what happened after a worker crash, retry,
external outage, or manual intervention.


---

## Policy Input Contracts

_Source: `generated-project/docs/contracts/policy-inputs.md`_

# Policy Input Contracts

Use this file for permission and authority decisions that matter across the
system.

Policy can live in application code, a policy module, a rules engine, database
constraints, or a service boundary. The important part is that inputs and
decisions are visible and testable.

## Authority Dimensions

Record the dimensions this project uses:

- actor identity
- role or membership
- tenant or ownership boundary
- resource classification
- action
- environment
- feature flag or rollout state
- approval or coordination state

## Policy Registry

| Decision | Inputs | Allow result | Deny result | Audit event |
| --- | --- | --- | --- | --- |
| `can_invite_team_member` | actor, team, target email, role | invitation command allowed | denied with reason | `team_invite_policy_checked` |
| `can_export_report` | actor, tenant, report type, data class | export allowed | denied with reason | `report_export_policy_checked` |

## Core Fields

For each policy decision, record:

- decision name
- inputs
- allow result
- deny result
- audit or trace event
- tests or examples

## Guidance

Permission decisions should be easy to call from every entry point that needs
them. Tests should include representative allow and deny cases.


---

## Telemetry And Audit Event Contracts

_Source: `generated-project/docs/contracts/telemetry-events.md`_

# Telemetry And Audit Event Contracts

Use this file for events needed to understand production behavior.

Telemetry should help future agents, operators, and reviewers reconstruct what
happened while respecting private data and reducing reliance on memory.

## Event Types

- trace span
- metric
- structured log
- audit event
- deployment event
- health check

## Common Correlation IDs

- request id
- actor id
- tenant id
- resource id
- workflow id
- deployment id
- idempotency key

## Registry

| Event | Type | Core fields | Sensitive fields | Purpose |
| --- | --- | --- | --- | --- |
| `team_invitation_created` | audit | actor id, team id, invitation id | email address | reconstruct invitation lifecycle |
| `workflow_step_failed` | log | workflow id, step, reason, retry count | payload contents | operate background work |
| `deployment_completed` | audit | deployment id, version, environment, actor | secret values | reconstruct release history |

## Guidance

Prefer stable event names and structured fields. Record enough context to connect
user intent, data changes, workflows, side effects, and deployment behavior.


---

## Threat Model

_Source: `generated-project/docs/security/threat-model.md`_

# Threat Model

This project should maintain a live threat model for sensitive data, credentials,
deployment access, external systems, destructive operations, tenant boundaries,
and high-impact coding-agent work.

Use this file as a working document. Keep it practical and specific to the
project.

## Scope

- project:
- primary users:
- tenant model:
- sensitive data:
- external systems:
- irreversible actions:
- deployment targets:

## Coding-Agent Access Questions

- What can coding agents read?
- What can coding agents write?
- What repository, cloud, database, or deployment credentials can they access?
- What commands, tools, or automation can they run?
- What changes deserve human review before merge or deployment?
- What generated code paths are high impact?
- What signal would reveal a harmful change before users feel it?

## Product And Operations Questions

- What data requires special handling?
- What external systems can the product touch?
- What actions have financial, legal, privacy, or trust impact?
- What actions should be auditable?
- What tenant or ownership boundaries exist?
- What operational credentials exist?
- What deployment path can affect production?
- What rollback or mitigation path exists for high-impact changes?

## Core Controls

- secrets are stored in approved secret managers or environment systems
- credentials use least privilege
- high-impact actions have clear owners
- sensitive data is excluded from casual logs and screenshots
- cross-tenant access is denied by default in policy or data design
- migrations and destructive operations have backups or mitigation plans
- production changes leave deployment evidence
- security-sensitive behavior has tests or review evidence

## Open Threats

| Threat | Impact | Likelihood | Control | Owner | Status |
| --- | --- | --- | --- | --- | --- |
| Unauthorized data export | privacy breach | medium | policy check, audit event, least privilege credentials | project maintainers | open |

## Review Triggers

Review this threat model when adding or changing:

- authentication or authorization
- tenant ownership
- sensitive data storage
- external integrations
- payment or financial actions
- deployment credentials
- destructive commands
- migrations touching important data
- broad coding-agent permissions


---

## ADR Guide

_Source: `generated-project/docs/adr/README.md`_

# Architecture Decision Records

Use ADRs for decisions that future developers or agents might reasonably
question.

Good ADR subjects:

- choosing or replacing a core technology
- adding a language, framework, runtime, package manager, database, queue,
  workflow engine, policy engine, or cloud service
- changing a public API
- changing a state machine
- introducing a new external integration or side-effect capability
- changing policy or approval behavior
- changing persistence ownership or constraints
- changing deployment or infrastructure strategy
- accepting a meaningful security, reliability, cost, or delivery tradeoff

ADRs should be short. A clear decision with context, consequences, and follow-up
beats a long essay.

Use `docs/templates/adr.md` as the starting point.


---

## Initial Doctrine ADR

_Source: `generated-project/docs/adr/0001-adopt-agentic-engineering-doctrine.md`_

# ADR 0001: Adopt Agentic Engineering Guidance

- status: accepted
- date: 2026-01-01

## Context

This project will be developed with autonomous coding agents. Agents need enough
context to make decisions, improve code, run checks, update docs, and prepare
delivery with inherited knowledge of the project's goals.

Agentic development works best when the repository contains:

- a project profile with local facts and stack choices
- a product-intent space for rough goals and examples
- an operating guide for coding agents
- lightweight architecture and contract docs
- decision records for durable choices
- practical verification and deployment guidance

## Decision

We adopt the generated agentic engineering guidance as the starting operating
system for this repository.

The core doctrine is:

```text
Autonomous coding agents inspect, decide, implement, test, document, and prepare
delivery. Their work leaves evidence that future humans and agents can use:
clear intent, coherent changes, useful checks, deployment context, and durable
decisions.
```

Project-specific decisions may refine this guidance in `docs/project-profile.md`
or future ADRs.

## Consequences

- Coding agents can make local implementation decisions directly.
- Important durable decisions get recorded where future agents can find them.
- Verification scales with risk and blast radius.
- Deployment and operational notes are part of meaningful delivery work.
- The project owns these generated docs and should adapt them as the product
  becomes real.

## Initial Stack Profile

- frontend: Project choice
- backend domain core: Project choice
- workflow runtime: Project choice
- durable database: Project choice
- policy engine: Project choice
- cloud target: Undecided


---

## ADR Template

_Source: `generated-project/docs/templates/adr.md`_

# ADR <number>: <decision title>

- status: proposed | accepted | superseded
- date: YYYY-MM-DD
- owner: <name or role>

## Context

What goal, constraint, risk, or opportunity created this decision?

What facts from the repository matter?

## Decision

What are we choosing?

## Rationale

Why does this choice best serve the project now?

## Consequences

- <benefit, cost, tradeoff, migration, or operational consequence>

## Follow-Up

- <task or owner>


---

## Feature Brief Template

_Source: `generated-project/docs/templates/feature-brief.md`_

# Feature Brief: <feature name>

- status: draft
- owner: <name or role>
- date: YYYY-MM-DD

## Goal

As a <user or actor>, I want to <intent>, so that <outcome>.

## Context

- relevant docs:
- relevant code:
- relevant ADRs:
- examples:

## Product Behavior

What should happen?

- <behavior>

## Domain Concepts

- <domain object>
- <domain object>

## First-Class Change

Does this feature introduce a new durable concept, authority boundary, state,
event, data flow, side effect, command, or deployment behavior?

If yes:

- where is it represented first-class?
- what existing abstraction changes?
- what contracts or docs change?
- what tests prove the new model?

## State And Events

States:

- <state>

Events:

- <event>

Rejected or unavailable transitions:

- <transition>

## Authority

- authenticated actor:
- user permissions:
- ownership or tenant boundary:
- coordination or approval:

## Persistence

Durable facts:

- <fact>

Constraints:

- <constraint>

Audit records:

- <audit event>

## Side Effects And Integrations

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

## Verification

- <test, command, property, or manual check>

## Deployment Notes

- config:
- migrations:
- rollout:
- rollback or mitigation:


---

## Agent Task Template

_Source: `generated-project/docs/templates/agent-task.md`_

# Agent Task Brief: <task name>

Use this template when assigning bounded work to an agent or future coding
session.

## Goal

What should be true when the task is complete?

## Context

Relevant files, docs, ADRs, decisions, examples, or commands:

- <path or note>

## Decision Latitude

What decisions can the agent make directly?

- <decision>

What decisions deserve an ADR, profile update, or user confirmation?

- <decision>

## System Area

Where does this task sit?

- interface:
- entry point:
- domain behavior:
- data or persistence:
- policy or permission:
- workflow or background work:
- external side effect:
- observability:
- deployment:
- docs:

## Expected Work

- <implementation or documentation step>

## Verification

- <command, test, review, or manual check>

## Delivery Notes

- <deployment, migration, config, or operational note>

## Open Questions

- <question>


---

## Threat Model Template

_Source: `generated-project/docs/templates/threat-model.md`_

# Threat Model: <feature or system>

- owner: <name or role>
- date: YYYY-MM-DD

## Scope

- system or feature:
- users or actors:
- data:
- external systems:
- deployment targets:

## Assets

- <asset>

## Trust Boundaries

- <boundary>

## High-Impact Actions

- <action>

## Threats

| Threat | Impact | Likelihood | Control | Owner | Status |
| --- | --- | --- | --- | --- | --- |
|  |  |  |  |  |  |

## Controls

- <control>

## Verification

- <test, check, review, log, alert, or runbook>

## Open Questions

- <question>


---

## State Machine Template

_Source: `generated-project/docs/templates/state-machine.md`_

# State Machine: <name>

## Entity

- entity:
- owner:

## States

- <state>

## Events

- <event>

## Transitions

| Current state | Event | Guard or facts | Next state | Side effects | Tests |
| --- | --- | --- | --- | --- | --- |
|  |  |  |  |  |  |

## Terminal States

- <state>

## Persistence

- table or store:
- state column or representation:
- constraints:

## Observability

- audit event:
- log or trace:
- metric:

## Open Questions

- <question>


---

## Template Maintainer Guide

_Source: `AGENTS.md`_

# Template Maintainer Guide

This repository is a Copier template for seeding new projects with reusable
guidance for autonomous coding agents.

Generated project files live under `template/`. Files outside `template/` are
maintainer files for this template repository and stay local to this repository.

## Core Doctrine

Preserve this doctrine across template changes:

```text
Autonomous coding agents are collaborators with initiative.
They inspect, decide, implement, test, document, and prepare delivery.
Their work leaves evidence: clear intent, coherent changes, useful checks,
deployment context, and decisions that future agents can understand.
```

Keep the template focused on principles, operating structure, decision records,
and project-local customization points. Add framework code only when a reusable
project boundary genuinely needs it.

## Maintainer Rules

- Keep generated files portable across product domains.
- Prefer variables in `copier.yml` over hard-coded project identity.
- Keep `AGENTS.md.jinja` short enough that future agents read it.
- Put reusable doctrine in `docs/engineering/`.
- Put operational contracts in `docs/contracts/`.
- Put threat-model guidance in `docs/security/` and templates in
  `docs/templates/`.
- Put architectural maps and stack guidance in `docs/architecture/`.
- Put project-local specialization in `docs/project-profile.md`.
- Use ADRs for decisions that future agents might reasonably question.
- Keep normal use free of submodule requirements.
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
  --data frontend="TypeScript/React" \
  --data backend="Rust" \
  --data workflow_runtime="Project choice" \
  --data database="PostgreSQL" \
  --data policy_engine="Application policy module" \
  --data cloud_target="AWS"
```

Stack answers are freeform. Use the project's actual intended tool choices.

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
    contracts/
    adr/
    templates/
  scripts/
    doctor.sh.jinja
```

Files under `template/` are copied or rendered into generated projects. Files at
the repository root maintain this template.

Files ending in `.jinja` are rendered by Copier. The final generated file drops
the `.jinja` suffix. For example:

```text
template/README.md.jinja -> README.md
template/scripts/doctor.sh.jinja -> scripts/doctor.sh
```

Static docs with zero project variables stay as plain `.md` files.

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
