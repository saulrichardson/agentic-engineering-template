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
