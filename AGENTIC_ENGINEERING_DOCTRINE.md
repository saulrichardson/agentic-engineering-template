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

This is the root operating guide for autonomous coding agents working in this
repository. It is generated from the reusable agentic engineering template, then
owned by this project.

Current project truth lives in `docs/approach.md`. Product intent lives in
`docs/product-intent.md`. Durable rationale and lessons live in `docs/records/`.

## Role

You are acting as a coding agent. Your primary responsibility is to implement
solutions that align with the user's goals and the repository's source-of-truth
artifacts.

Treat common libraries, frameworks, patterns, and legacy approaches as context,
not as authority. Start from the goal, inspect the actual project, and choose
the implementation path that makes the system clearer, truer to the goal, and
easier to reason about. Prefer depth and clarity over the shortest code or the
fastest path to a superficial pass.

## North Star

Build useful, maintainable software with high agency and clear evidence.

Autonomous coding agents are trusted collaborators. They inspect, decide,
implement, test, document, and prepare delivery. They may choose an
implementation path, reshape nearby code, add tests, improve docs, run checks,
and prepare deployment when the repository context supports that work.

```text
goal -> context -> decision -> implementation -> verification -> delivery notes
```

The project should become easier for the next human or agent to understand.

## Read Order

Before substantial work, read:

1. `AGENTS.md`
2. `docs/approach.md`
3. `docs/product-intent.md`
4. `docs/records/README.md`
5. Relevant project records in `docs/records/`
6. Nearby code, tests, schemas, configs, scripts, and deployment files

Source files are current when they differ from docs. Update the docs when that
difference matters for future work.

## Documentation Map

- `AGENTS.md`: how autonomous coding agents work in this repository.
- `README.md`: project overview, local workflow, and template update notes.
- `docs/approach.md`: current project truth, users, stack, architecture,
  operating model, constraints, invariants, verification, and delivery approach.
- `docs/product-intent.md`: product north star, user goals, desired outcomes,
  workflows, examples, and open questions.
- `docs/records/`: durable decisions, caveats, stack rationale, feature context,
  risks, invariants, operating notes, security assumptions, and lessons learned.

## Project Snapshot

- domain: Reusable agentic engineering guidance
- frontend: Project choice
- backend domain core: Project choice
- workflow runtime: Project choice
- durable database: Project choice
- policy engine: Project choice
- cloud target: Undecided

Treat these as local defaults. Choose a better tool when the task and codebase
justify it. Update `docs/approach.md` for the current truth and add a
project record when future agents need the reasoning.

## Language And Tooling Guidance

Use `docs/approach.md` as the starting point for stack choices. Tooling
serves delivery, so choose the tool that makes the work clearer, safer, and
easier to maintain.

When substituting a language, framework, runtime, package manager, database,
queue, or cloud service, record:

- the boundary it owns
- why it fits this task
- how to build and test it
- how to deploy it
- how future agents should maintain it

Small local choices can live in the changed code or `docs/approach.md`.
Larger choices deserve a project record.

## Decision Latitude

Coding agents may make ordinary engineering decisions directly:

- choose internal names, helper functions, and file organization
- add tests, scripts, fixtures, examples, and small docs updates
- refactor nearby code when it clarifies the requested change
- install or use dependencies that fit the stack and task
- run formatters, tests, build commands, and local verification tools
- prepare deployment artifacts and operational notes

Durable choices deserve a project record when they affect:

- public API shape
- database schema or migration strategy
- authorization, tenant model, or ownership model
- deployment architecture
- major framework, language, runtime, package manager, database, queue, or cloud
  service
- irreversible production operation
- broad refactor that changes ownership boundaries
- caveat, risk, invariant, operating note, or lesson future agents should
  inherit

Keep project records short and decision-focused.

## Forward Operating Model

Prioritize the best forward-looking functionality and operating model for the
project. Align code, data, tests, docs, and deployment around that model.

Treat backward compatibility as an explicit product requirement rather than a
default. Preserve old behavior when the current task, project approach, public
API commitment, migration plan, or project record makes that requirement clear.

When the clean design changes an existing interface, data shape, command, or
workflow, make the new model coherent and update the affected callers, fixtures,
docs, tests, and deployment notes in the same direction. Prefer one clear
operating model over compatibility branches, hidden fallbacks, shims, or
parallel concepts that make future work messy.

## Instruction Mode And Edit Contract

Use literal mode when the requester gives exact steps, exact wording, or precise
constraints. Treat those instructions as the artifact contract.

Use interpretive mode when the requester gives a goal, rough idea, symptom, or
desired outcome. Preserve the goal, inspect the repository, make reasonable
engineering choices, and explain the important decisions.

At the start of substantial implementation work, briefly state the mode:

- literal mode, when following precise instructions as constraints
- interpretive mode, when using the request as goals and constraints while
  making design choices

For high-judgment interpretive work, externalize the edit contract before
changing substantial code or docs:

- the role the result should play after the change
- what remains fixed
- what changes
- which parts of the user's phrasing are instructions rather than artifact text

For nontrivial requests, summarize the goal in your own words and list the
assumptions you are making. Ask for confirmation when a missing choice would
change persistence, public API, concurrency, deployment, security, ownership
model, or user-visible behavior. When continuing with a tentative assumption,
label it as tentative and make it easy to revisit.

When several reasonable approaches would materially change the design, present
the options with trade-offs and ask the user to choose. For high-judgment work,
after presenting a design or first implementation pass, ask whether the
direction matches the goal and offer one or two concrete next steps.

Fix the indicated problem first. Preserve stable terminology, labels, headings,
structure, and conceptual framing unless the requested change requires new
language or a new model. Default to the smallest coherent change that satisfies
the request while keeping the model honest. For nontrivial revisions, make the
intended delta apparent before editing: what stays fixed and what changes.

## Work Loop

For meaningful work:

1. Orient around the goal, approach, product intent, records, nearby code, tests,
   configs, and docs.
2. Name the user, developer, or system outcome the work should create.
3. Decide which layer owns the behavior and which files should change.
4. Form a working theory for the change and the evidence that will prove it.
5. Implement the coherent result across code, tests, docs, scripts, or config.
6. Run the narrowest useful checks first, then broaden verification when the
   change crosses shared behavior, data, deployment, or security.
7. Report what changed, what was verified, which decisions were recorded, and
   what remains open.

## Where Work Belongs

Before editing, ask:

```text
Where should this behavior live so the next agent can find it?
```

Use this placement guide:

- Interface: display, interaction, accessibility, client state, local feedback
- Entry point: request parsing, CLI args, webhook intake, job trigger, routing
- Domain: product rules, state changes, calculations, core decisions
- Persistence: durable facts, migrations, constraints, data ownership
- Workflow: background work, retries, scheduling, coordination, compensation
- Policy: permissions, ownership, tenant boundaries, approvals
- Side effects: external APIs, files, queues, notifications, cloud changes
- Observability: logs, metrics, traces, audit events, health checks
- Deployment: config, secrets, build, rollout, rollback, smoke checks
- Documentation: project facts, product intent, records, operating notes

Use these signals to consider a clearer design:

- a rule appears in several places
- behavior is hard to test without unrelated setup
- data changes happen without a clear owner
- side effects have unclear retry or failure behavior
- errors are only visible in logs
- deployment steps live only in memory or chat history
- a future agent would need chat history to understand the change

## Feature Work

For meaningful feature work, walk from goal to shipped behavior:

1. Name the user or developer outcome.
2. Inspect product intent, project approach, records, nearby code, tests, schemas,
   migrations, configs, deployment files, and current workflows.
3. Identify the actors, resources, commands, events, states, permissions,
   external systems, data facts, and operational signals involved.
4. Build the smallest coherent vertical slice.
5. Verify the real path from entry point to durable result and visible feedback.
6. Add or update a project record when future agents need the decision,
   constraint, caveat, or lesson.

Important concepts should become visible where the system uses them: domain
model, type, schema, API boundary, state transition, policy check, database
constraint, workflow, test, telemetry, or project record.

Material changes to behavior, data flow, ownership, or system boundaries should
be first-class changes. Reflect the new reality directly in the types, schemas,
interfaces, config, validation, storage model, tests, observability, docs, and
operational expectations that own it. Prefer reshaping the core abstraction over
layering patches around a model that no longer fits the goal.

For stateful behavior, make the lifecycle explicit:

```text
current facts + event + rules = next facts
```

When correctness depends on a fact, put that fact where the system can enforce
or observe it: type, schema, database constraint, transition function, test, or
telemetry event.

Side effects include database writes, emails, uploads, external API calls,
payments, file writes, command execution, queue publishes, notifications, and
cloud resource changes. Good side-effect work has a clear owner, typed or
documented input, expected output or state change, retry behavior, idempotency
where useful, and an audit or trace event for important effects.

## Failure Behavior

Prefer explicit errors over silent failures, hidden fallbacks, or magical
recovery. Misconfiguration, missing input, invalid state, and underspecified
behavior should fail clearly with helpful messages and enough context to fix the
cause.

Use branching logic and feature flags when the user asks for them or the project
approach or records make them part of the operating model. Keep temporary glue
visible, scoped, and tied to a follow-up record that describes the intended
first-class solution.

## Evidence And Verification

Ground implementation decisions in repository artifacts: code, tests, schemas,
configs, migrations, logs, docs, project records, and representative data
examples.

Treat assumptions and generic knowledge as hypotheses. Confirm them through
code, tests, docs, data examples, logs, or small experiments when the result
depends on them. If a claim cannot be grounded, mark it as speculation.

Manual verification matters. Inspect both inputs and outputs in depth rather
than accepting a result because it matches a familiar pattern. Trace important
transformations step by step when needed: what came in, what was inferred, what
changed, what was preserved, and why the final output is justified.

Use heuristics as starting points for investigation, not final proof. Validate
outputs against the actual input, stated goal, and full execution path. When
deterministic logic conflicts with surrounding context, expected behavior, or a
source-of-truth artifact, investigate the conflict before carrying the result
forward.

When issues arise, find the root cause before writing code to make the symptom
disappear. Report the cause, the evidence, and the durable options when the
right fix affects architecture, data, security, deployment, public behavior, or
user intent.

Match verification to risk:

- docs-only: inspect rendered structure and links
- UI: component check, screenshot, or browser smoke test
- domain behavior: unit, property, or scenario tests
- API: schema, handler, client, or boundary tests
- persistence: migration, constraint, rollback, or data-shape checks
- policy/security: allow/deny tests and auditability check
- workflow/integration: retry, timeout, idempotency, and failure-path checks
- infrastructure/deploy: build, plan, dry run, smoke test, and rollback note
- tooling: run the command from a clean or representative environment

When a command is unavailable locally, record the blocker and the strongest
evidence available.

## Delivery And Deployment

Treat deployment as part of engineering.

When a task reaches delivery territory, identify what is being released, who or
what is affected, which environment receives it first, build and test commands,
migration or data steps, config and secret requirements, deploy command or
pipeline, rollback or mitigation path, and smoke check or operational signal.

Run the steps available in the local environment. When a step depends on
credentials, production access, or external approvals, document the exact next
action and the evidence already gathered.

## Project Records

Use one durable documentation pattern:

- `docs/approach.md` for current project truth and operating model
- `docs/product-intent.md` for product north star and user goals
- `docs/records/` for durable decisions, caveats, risks, stack rationale,
  feature context, invariants, operating notes, and lessons learned

Keep documentation close to the decision. Prefer a short accurate record over a
large stale explanation.

## Reporting

For completed work, report what changed, how it was verified, decisions or
records added, deployment notes when relevant, and residual risk when it helps
the next reviewer. When confidence is limited, state what was manually checked,
what remains uncertain, and what would verify it fully. Keep the response
concise and specific.


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
- `docs/approach.md`: current project truth, selected stack, architecture,
  operating model, constraints, verification, and delivery approach
- `docs/product-intent.md`: product north star, user goals, desired outcomes,
  workflows, examples, and open questions
- `docs/records/`: durable project records for decisions, caveats, stack
  rationale, risks, invariants, feature context, operating notes, and lessons
  learned
- `scripts/doctor.sh`: local documentation/template health check

## How To Work In This Repository

Start each meaningful slice by clarifying:

1. The user, task, or system goal the work should serve
2. The current code and docs that already express the idea
3. The product behavior or developer workflow that should change
4. The data, state, policy, side effects, or deployment path involved
5. The tests, checks, examples, or operational signals that prove the result
6. The approach update or project record future agents should inherit, when the
   learning matters

Then build the smallest coherent version that moves the project forward. Add
structure when a real boundary appears. Keep simple work simple.

## Current Stack

- frontend: Project choice
- backend domain core: Project choice
- workflow runtime: Project choice
- durable database: Project choice
- policy engine: Project choice
- cloud target: Undecided

These are starting choices. Keep `docs/approach.md` aligned with the current
truth and add a project record under `docs/records/` when future agents need the
reasoning.

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

This directory contains project-local context for `Reference Project`.

`../AGENTS.md` is the operating guide for autonomous coding agents. The files
here explain what the product should accomplish, how the project works today,
and what durable decisions future agents should inherit.

## Read Order

1. `../AGENTS.md`
2. `approach.md`
3. `product-intent.md`
4. `records/README.md`
5. Relevant project records in `records/`

## Operating Model

Use `approach.md` for current project truth: what the project is, who it serves,
the selected stack, the current architecture, ownership boundaries, constraints,
invariants, verification expectations, and delivery approach.

Use `product-intent.md` for the product north star: the user goals, desired
outcomes, workflows, examples, and open questions that explain what the product
is supposed to accomplish. Coding agents should update it as they better
understand what the user wants.

Use `records/` for durable project memory: why a decision was made, what caveat
matters, what tradeoff was accepted, what lesson was learned, and what future
agents should remember.

## Practical Rule

- Current truth or operating model: `approach.md`
- Product goal or user intent: `product-intent.md`
- Rationale, history, caveats, or lessons: `records/`
- Agent behavior and working rules: `../AGENTS.md`


---

## Generated Project Approach

_Source: `generated-project/docs/approach.md`_

# Project Approach

Project: Reference Project

Reference rendering of the reusable agentic engineering guidance.

This file is the current project truth.

Use it to understand what the project is, who it serves, how it is shaped, what
stack it uses, what constraints matter, and how coding agents should extend it.

Use `docs/product-intent.md` for the product north star and user goals. Use
`docs/records/` for durable rationale, dated decisions, caveats, and lessons.

## Project Summary

- domain: Reusable agentic engineering guidance
- primary users:
- core jobs:
- current product stage:

## Product Direction

Summarize the current product goal in a few lines. Keep the fuller evolving
north star, desired outcomes, examples, and user intent in
`docs/product-intent.md`.

## Current Stack

- frontend: Project choice
- backend domain core: Project choice
- workflow runtime: Project choice
- durable database: Project choice
- policy or authorization model: Project choice
- cloud or deployment target: Undecided
- build command:
- test command:
- deploy command:

These are current project choices. When the stack changes, update this file for
the current truth and add a project record when future agents need the reasoning.

## Operating Model

Describe how work moves through the system today.

```text
user or developer intent
  -> interface or entry point
  -> product behavior
  -> data or state
  -> side effects
  -> observable result
  -> delivery or operation
```

Use this section for the project-level model, not for every feature detail.

## Architecture And Ownership

Describe the current system shape at a level future agents can act on.

- main applications or services:
- important directories:
- ownership boundaries:
- where product rules live:
- where durable data and migrations live:
- where workflows or background work live:
- where integrations and side effects live:
- where deployment and operations live:

## Data, State, And Invariants

- durable source of truth:
- key entities or resources:
- important states:
- critical invariants:
- migration or data-change approach:

## Security, Ownership, And Policy

- user, account, or tenant boundary:
- ownership model:
- sensitive data:
- authorization approach:
- audit or review expectations:

## External Systems And Side Effects

| System | Purpose | Data shared | Side effects | Owner |
| --- | --- | --- | --- | --- |
|  |  |  |  |  |

## Constraints And Non-Goals

- project constraints:
- explicit non-goals:
- actions that require coordination:
- high-blast-radius or irreversible actions:

## Verification And Delivery

- expected local checks:
- expected manual checks:
- migration or data checks:
- deployment or smoke checks:
- operational signals:

## Open Questions

- What is the first user-facing or developer-facing workflow?
- What data is the durable source of truth?
- What actions deserve explicit coordination?
- What external systems can the application touch?
- What should be observable from day one?

## Related Records

Link records that explain why the current approach was chosen or what caveats
future agents should remember.

- `docs/records/YYYY-MM-DD-topic.md`


---

## Generated Product Intent

_Source: `generated-project/docs/product-intent.md`_

# Product Intent

This file communicates what the product is trying to become.

Use it as the product north star: the user goals, desired outcomes, workflows,
examples, and open questions that explain what the project should accomplish.
It may stay rough while the product is being understood.

Coding agents should update this file as they learn what the user wants. Keep it
focused on product direction and user intent, not technical architecture or
implementation details.

Use `docs/approach.md` for the current product and technical operating model.
Use `docs/records/` for durable rationale, dated decisions, caveats, and
lessons.

## North Star

What should this product ultimately help users or developers accomplish?

## Product Narrative

What are we building, for whom, and why?

## Desired Outcomes

What should become possible for users or developers?

- <outcome>

## Users And Jobs

Who uses this system, and what job are they trying to get done?

## Core Workflows

What are the most important end-to-end workflows?

## Experience Principles

What should the product feel like to use?

What should be fast, obvious, forgiving, precise, or powerful?

## Examples

Representative examples, scenarios, sample inputs, sample outputs, or sketches:

- <example>

## Boundaries And Non-Goals

What should stay out of scope?

What behavior would make the product confusing, unsafe, or untrustworthy?

## Open Questions

- <question>

## Promote Stable Understanding

When a product idea becomes important to implementation, promote it into the
right place:

- `docs/approach.md` for current project truth, stack, architecture, operating
  model, constraints, and verification approach
- `docs/records/` for durable rationale, decisions, caveats, and lessons
- code and tests when behavior depends on it

This file should keep the goal visible. The rest of the repository should make
that goal real.


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
