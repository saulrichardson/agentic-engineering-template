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
3. `docs/product-intent.md`
4. `docs/engineering/agent-execution-protocol.md`
5. `docs/engineering/definition-of-done.md`
6. `docs/engineering/doctrine.md`
7. `docs/engineering/agentic-runtime.md` if the product contains runtime agents
8. `docs/architecture/system-map.md`
9. `docs/architecture/stack-profile.md`
10. Relevant contracts in `docs/contracts/`
11. Relevant threat model in `docs/security/`
12. Relevant ADRs in `docs/adr/`
13. Relevant templates in `docs/templates/`

`AGENTS.md` is the root operating guide for future coding agents.
`docs/project-profile.md` is where the project records its local facts,
constraints, stack choices, and deviations. ADRs are where the project records
decisions that future agents might otherwise accidentally undo.
`docs/product-intent.md` is where users can freely dump thoughts about what the
product should do, who it serves, desired workflows, examples, runtime-agent
behavior, constraints, and open questions before those ideas become formal
contracts or ADRs.
`docs/architecture/stack-profile.md` records preferred implementation languages
and toolchain guidance. Coding agents should start there, then choose the next
best option when the preferred stack is insufficient, as long as the substitute
preserves the project principles and is recorded in the project profile or an
ADR.

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
  product-intent.md
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
  --data frontend="PureScript" \
  --data cloud_target="AWS"
```

Stack answers are freeform. Use the project's actual intended tool choices
instead of accepting defaults when the defaults do not fit.

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
