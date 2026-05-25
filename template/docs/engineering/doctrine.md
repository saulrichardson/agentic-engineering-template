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
