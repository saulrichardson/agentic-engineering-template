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
  architecture/
    system-map.md
    stack-profile.md
  contracts/
    README.md
    state-machines.md
    workflow-events.md
    policy-inputs.md
    telemetry-events.md
  security/
    threat-model.md
  adr/
    README.md
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
