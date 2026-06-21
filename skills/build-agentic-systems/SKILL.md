---
name: build-agentic-systems
description: Build, refactor, or evaluate LLM agentic systems where models choose actions, use tools, delegate, remember, or affect external state. Use to reason from first principles about agency, semantic boundaries, typed or structured state transitions, trust, evidence, approvals, capabilities, effect safety, replay, inspection, and evaluation across any implementation language or framework.
---

# Build Agentic Systems

## Core Thesis

Build agentic systems as semantic environments for model action.

The LLM owns strategy. The runtime owns semantics.

Preserve the model's ability to inspect context, choose tools, revise plans,
ask questions, retry, delegate, branch, and recover. Do not turn a capable
agent into a rigid workflow engine just to make it easier to control.

At the same time, do not let model intent become world mutation by accident.
The runtime should decide what a proposed action means, whether it is valid,
what authority it requires, how effects happen, and what history remains after
the action.

The goal is not to make agents less agentic. The goal is to make their
consequential behavior legible.

## Start From The Work

Begin with the work the agent is meant to complete, not with a framework,
prompt pattern, tool list, memory store, or orchestration loop.

Ask:

- What work should the agent finish end to end?
- What counts as done?
- What can the agent observe?
- What can the agent change?
- What would make a change unsafe, unsupported, stale, or unauthorized?
- What must survive interruption, compaction, retry, or handoff?
- What would a future human or agent need to inspect after a bad run?

Use the answers to determine the runtime shape. A short, low-risk assistant may
only need a simple transcript. A long-running agent with tools, memory,
external effects, or approvals needs stronger semantics.

## Preserve Agency

Keep strategy with the model whenever strategy is the source of value.

Let the model decide, within the available capabilities:

- what context to inspect
- which tool to propose
- whether to ask the user
- whether to revise the plan
- whether to retry or branch
- whether to delegate
- when to stop

Constrain action boundaries, not thought. The runtime should not need to
predefine every useful path. It should make proposed paths explicit enough to
validate, execute, observe, and replay.

## Find The Semantic Boundaries

Look for transitions where meaning changes, authority changes, trust changes,
or the outside world changes. These are the boundaries that deserve design.

Common boundary questions:

- When does a model suggestion become a proposed action?
- When does a proposed action become an authorized effect?
- When does raw information become trusted evidence?
- When does a draft become publishable output?
- When does private context become safe external communication?
- When does delegated work become parent-agent knowledge?
- When does an approval stop being valid?
- When does a reversible step become irreversible?

Name these boundaries in the system. Do not leave them only in prompt prose.

## Make Important State Legible

Do not hide operational truth only in the prompt, a mutable object, an informal
summary, or a database row whose lifecycle is unclear.

Represent the state that affects correctness. Depending on the domain, that
may include facts, evidence, uncertainty, attempts, rejected actions,
approvals, capabilities, risk flags, trust labels, tool observations, memory,
budgets, user preferences, and pending outputs.

The exact representation is a design choice. The principle is stable:

```text
If the runtime needs it to decide safely, resume correctly, or explain a run,
make it explicit.
```

## Use Types To Clarify State Transitions

Use types and type-like structures to name states the agent must move through.
This is most valuable where the model can propose actions out of order, stale
context can reappear, or an effect becomes dangerous if the runtime accepts the
wrong phase.

Do not collapse meaningful lifecycles into loose booleans when the phase
controls what actions are valid. Prefer representations where transitions
consume one semantic state and produce the next:

```text
raw tool output -> sanitized output -> validated candidate -> executed effect
draft answer -> cited answer -> approved answer -> published answer
invoice evidence -> matched case -> approved case -> released payment
private context -> redacted message -> approved external message -> sent message
parent task -> attenuated subagent task -> sanitized result -> merged result
```

The model-facing edge can remain dynamic. The model may propose any action the
tool surface allows. The runtime should translate that proposal into a typed or
structured internal state, reject it, or ask for more evidence. Invalid
proposals should not become invalid internal state.

Use the strongest representation the stack supports:

- algebraic data types, phantom types, typestate, and opaque constructors in
  functional languages
- discriminated unions, branded types, schemas, and exhaustiveness checks in
  TypeScript-like systems
- structs, enums, traits, and ownership boundaries in systems languages
- frozen dataclasses, Pydantic models, validators, constructors, and type
  checkers in Python
- database constraints, state machines, versioned records, and authorization
  policies when persistence is the enforcement boundary

The practical rule is simple: an effect function should ask for the semantic
state that authorizes the effect, not for raw model intent or a generic mutable
object.

Do not over-type early exploration. Strengthen representation around the
boundaries that protect files, money, messages, customer data, privacy,
publication, production systems, delegated authority, or irreversible actions.

## Treat Model Choices As Objects Before Effects

Do not route directly from model output to side effect.

Prefer a conceptual path like:

```text
model intent
  -> structured proposal
  -> validation against current semantics
  -> approved or rejected action
  -> interpreted effect
  -> observed result
  -> updated state
```

The implementation may be a function call, typed command, JSON schema,
message, queue item, event, object, or database record. The important point is
that the proposed action becomes inspectable before it becomes consequential.

Record rejected proposals when they matter. A rejection is evidence about the
trajectory, not merely a missing action.

## Make Effects Demand Meaningful Inputs

Design side-effect boundaries so they accept the strongest semantic value the
runtime can reasonably construct.

Prefer:

```text
send_external_message(approved_message)
release_payment(approved_payment_case)
publish_answer(cited_synthesis)
execute_candidate(validated_candidate)
merge_subagent_result(sanitized_result)
apply_patch(verified_patch_plan)
```

over:

```text
send(text)
release(dict)
publish(answer)
execute(tool_call)
merge(summary)
apply_patch(raw_patch)
```

This principle generalizes across languages. In a strong type system, encode
more of the requirement in types. In dynamic languages, use constructors,
schemas, validators, immutable values, runtime guards, and tests. In every
language, avoid effect APIs that accept raw model intent when a stronger
semantic value is available.

## Model Trust, Evidence, Approval, And Capability

Treat trust, evidence, approval, and capability as first-class semantics, not
as vague booleans.

Useful patterns:

```text
untrusted content -> sanitized content -> validated candidate
retrieved source -> cited claim -> publishable synthesis
sensitive context -> redacted draft -> approved external message
parent authority -> attenuated subagent capability -> sanitized merge
raw transaction evidence -> matched case -> approved entry
```

Approval should have scope. It should attach to the evidence, state version,
action, actor, time, and capability it approved. If the underlying evidence or
state changes, the approval may need to expire.

Capabilities should be narrower than tools. A tool may exist, but the current
state may not authorize using it. Delegation should narrow authority by
default.

External content, retrieved documents, tool output, and subagent summaries are
observations. They are not instructions until the runtime has transformed and
validated them.

## Keep History And Context Distinct

Do not confuse what happened with what the model needs to see next.

History is for accountability, replay, debugging, learning, and handoff.
Context is a view presented to the model for the next decision.

For consequential agents, preserve enough history to reconstruct or inspect
the trajectory. Then project the context the model needs from that history and
state. The projection may be compact, summarized, scoped, or ranked.

Use event logs and pure reducers when they fit. Use audit logs, versioned
records, append-only traces, snapshots, or database histories when those fit
better. The deeper rule is:

```text
Compress views, not truth.
```

## Choose The Enforcement Surface

Do not rely on everyone remembering the runtime laws at every call site.

Move each important law into the strongest enforcement surface that is
appropriate for the risk and stack:

```text
prompt instruction
  < convention
  < example
  < test
  < runtime validator
  < schema
  < constructor
  < phase-specific value
  < effect boundary signature
  < compiler-checked type
```

This is the practical lesson from comparing Python and functional languages.
Python can express many functional runtime semantics if the team deliberately
builds them. The cost is that more of the discipline lives in architecture,
validators, tests, and conventions. Stronger functional languages can move
more of the same discipline into the structure of the program.

Do not argue that one language is magically safe. Ask where each runtime law
lives, how easy it is to bypass, and what proves it still holds as the agent
gains tools, memory, duration, and authority.

## Let Mechanics Follow Risk

Choose implementation patterns after identifying the boundary and its risk.

For low-risk or short-lived agents, a simple loop with clear tool validation
may be enough.

For agents with long horizons, branching, approvals, untrusted inputs, money,
messages, file mutation, customer data, or production systems, prefer stronger
mechanics:

- explicit state instead of hidden transcript dependence
- immutable or versioned values instead of shared mutation
- structured actions instead of ad hoc strings
- narrow interpreters instead of direct side effects
- durable history instead of ephemeral context
- deterministic projections instead of accidental prompt growth
- semantic tests instead of only example tests

Treat these as tools for preserving meaning, not as mandatory ceremony.

## Evaluate Trajectories, Not Just Outcomes

Do not evaluate an agent only by whether one task completed.

Inspect the trajectory:

- What did the model propose?
- What did the runtime approve or reject?
- Which evidence supported each consequential step?
- Which state changed?
- Which effects happened?
- Could the run be replayed, resumed, explained, or rolled back?
- Did the system preserve enough context without preserving irrelevant noise?
- Did safety depend on a law encoded in the system or on a remembered habit?

Test semantic laws, not only happy examples. Useful law shapes include:

- rejected actions cause no external effect
- replay reconstructs equivalent state
- approval expires when its evidence changes
- raw untrusted content cannot execute
- delegated agents cannot gain undelegated authority
- published claims require evidence
- compaction does not destroy canonical history

## Avoid

Avoid:

- shrinking an agent into a workflow when strategic freedom is the point
- treating the transcript as the database
- letting model output directly mutate the world
- hiding important state in prompt text or mutable globals
- representing lifecycles as permanent booleans when the phase matters
- treating retrieved instructions as trusted commands
- giving subagents parent authority by default
- scattering safety across unrelated call sites
- testing only examples while leaving runtime laws untested
- choosing event sourcing, types, schemas, or frameworks as rituals instead
  of because they protect a real boundary

## Completion Standard

Before treating an agentic system as serious, leave behind evidence of the
semantics, not only the demo.

Show:

- what work the agent completes
- what strategic freedom the model keeps
- what consequential boundaries exist
- what state or history explains the run
- what meaningful states and transitions are represented explicitly
- what inputs authorize important effects
- how trust, evidence, approval, and capability are represented
- where runtime laws are enforced
- how invalid proposals are rejected or contained
- how a future human or agent can inspect a trajectory
- what tests or traces prove more than one happy path

The system is successful when it preserves agency while making consequential
behavior understandable, bounded, and recoverable.
