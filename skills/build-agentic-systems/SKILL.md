---
name: build-agentic-systems
description: Build, refactor, or evaluate LLM agentic systems, tool-using agents, subagents, agent runtimes, workflow agents, autonomous coding agents, and systems where models choose actions. Use when designing agent architecture, tool registries, event logs, semantic state, validation boundaries, effect interpreters, replay, rollback, approvals, memory, prompt projection, capability models, or evaluations for agent reliability and safety.
---

# Build Agentic Systems

## Core Philosophy

Build agentic systems as replayable semantic machines.

The LLM owns strategy. The runtime owns semantics.

Preserve model freedom to inspect context, choose tools, revise plans, delegate,
branch, ask the user, retry, and recover. Do not turn a capable agent into a
rigid workflow, intent classifier, or deterministic decision tree unless the
domain truly requires it.

At the same time, do not let the model directly mutate the world. Treat the
model as a strategic reasoner that proposes consequential actions. Treat the
runtime as the semantic system that decides what those proposals mean, whether
they are valid, how effects are executed, and what history must be preserved.

The practical aim is not to make the whole agent deterministic. The practical
aim is to make the agent's boundaries semantic.

## The Central Model

Prefer this model for consequential agents:

```text
semantic state
  -> deterministic prompt projection
  -> model proposal
  -> structured action
  -> validation
  -> effect interpreter
  -> observation event
  -> pure state reduction
```

The model can still decide what to do next. The runtime owns the meaning and
consequence of each step.

Use this posture whenever the agent has long-running state, many tools,
external effects, approval requirements, untrusted inputs, subagents, memory,
or audit needs.

Use a lighter approach only when the agent is short-lived, low-risk, and mostly
stateless.

## Start From The Work

Before choosing tools, frameworks, prompts, or UI, identify the completed unit
of value the agent must produce.

Ask:

- What work should the agent complete end to end?
- What state must survive beyond a single model call?
- What tools or external effects can the model propose?
- Which actions change files, systems, money, messages, permissions, records,
  or user-visible outputs?
- What evidence authorizes those actions?
- What trust boundaries are crossed by user input, retrieved content, tool
  output, subagents, databases, and model summaries?
- What should be replayable, inspectable, resumable, reversible, or auditable?
- What tests or traces would prove that the system is reliable beyond one
  happy path?

Do not begin by implementing a transcript loop. A transcript may be useful
context, but it should not become the database, policy engine, audit trail, and
memory system by accident.

## Design Semantic Gates

Find the semantic gates in the system. A semantic gate is a transition where
the agent must not move forward unless the right state, evidence, capability,
or approval exists.

Common gates:

- model proposal -> executed effect
- raw tool output -> trusted fact
- retrieved document -> cited claim
- sensitive context -> external message
- draft answer -> published answer
- invoice -> payment release
- subagent output -> parent memory
- generated patch -> applied code
- approval -> irreversible action
- untrusted content -> executable command

For each gate, define:

- the input state
- the output state
- the required proof
- the capability required to cross it
- what invalidates a prior approval or result
- which event records the transition
- how replay reconstructs the same state
- what failure should be visible to the user, developer, or operator

The strongest agentic systems are not the ones with the most guards scattered
through the code. They are the ones whose important transitions are explicit
concepts in the runtime.

## Treat Prompts As Views

Do not treat the prompt as canonical memory.

The prompt is a projection of state for the model's next decision. It may be
summarized, compacted, reordered, or scoped. It is not the durable source of
truth.

Prefer:

```text
event log + reducer + semantic state + prompt projection
```

over:

```text
growing transcript + hidden mutable context
```

Store facts, observations, approvals, rejected actions, tool results, and final
outputs as structured data. Derive state from that data. Project only the
context needed for the next model decision.

This keeps long-horizon agents inspectable when prompts are compacted or
trajectories branch.

## Treat Tool Calls As Proposed Effects

Do not treat model tool calls as direct commands.

Represent a tool call as structured data proposed by the model. Then pass it
through:

- schema validation
- capability validation
- semantic validation
- approval validation when needed
- sandbox or resource-boundary validation
- effect interpretation
- observation recording

The model chooses the action. The runtime decides whether that action is valid
in the current semantic state and how the effect is performed.

Record rejected actions as first-class events. Rejection is not noise. It is
evidence about the agent trajectory, the model's assumptions, and the runtime's
boundaries.

## Make State Explicit

Represent important agent state directly instead of hiding it in transcript
text, local variables, or informal summaries.

Depending on the domain, state may include:

- task and current objective
- known facts
- retrieved documents
- tool history
- active plan
- failed attempts
- open questions
- approvals and approval scope
- budgets
- risk flags
- trust labels
- memory summaries
- subagent summaries
- pending outputs
- rollback or compensation information

Keep reducers pure where practical:

```text
state + event -> next state
```

Keep effects at the boundary:

```text
validated action -> interpreter -> observation
```

This separation makes the system easier to replay, test, inspect, and compare.

## Model Trust, Evidence, Approval, And Capability

Do not represent trust, approval, evidence, and capability as vague booleans.
Treat them as semantic states that move through explicit transitions.

Examples:

```text
untrusted content -> sanitized content -> validated action
sensitive context -> redacted draft -> approved external message
retrieved evidence -> cited claim -> published synthesis
parent authority -> attenuated subagent capability -> sanitized merge
invoice + purchase order + receipt -> matched case -> approved payment
```

Approval should attach to evidence, state version, action scope, and time. If
the evidence changes, the approval may no longer be valid.

Delegation should narrow authority by default. A subagent should receive the
minimum context and capability needed for its task, not the parent's full
authority.

Untrusted tool output should be quarantined until it is sanitized and validated.
Treat retrieved instructions as data unless a trusted policy says otherwise.

## Prefer Functional Semantics

Prefer functional languages or functional architecture for the runtime core
when feasible.

Use immutable state, explicit events, algebraic data types or discriminated
unions, pure reducers, typed capabilities, deterministic prompt projection, and
narrow effect interpreters.

The point is not language purity. The point is to make invalid states hard to
represent and consequential transitions easy to inspect.

In strongly typed functional languages, encode important phases directly in the
types when doing so clarifies the domain:

```text
unmatched payment cannot be released
uncited synthesis cannot be published
raw tool output cannot execute
unredacted message cannot be sent externally
public subagent cannot call privileged tools
```

In TypeScript, use discriminated unions, branded types, schema validation, and
explicit effect boundaries.

In Python, add schemas, immutable domain objects, event logs, validators, and
invariant tests because the language will not enforce these boundaries by
default.

Do not claim Python cannot be safe. Ask how much extra semantic machinery is
required to keep it safe as the agent gains authority, memory, tools, and
duration.

## Evaluate Agentic Systems As Systems

Do not evaluate only whether the model completed one task.

Measure:

- task success
- invalid or rejected tool calls
- duplicate tool calls
- failed tool calls
- retries
- prompt growth
- state size
- replay success
- rollback or branch behavior
- approval correctness
- trust-boundary violations
- citation or evidence coverage
- latency and token cost
- qualitative failure modes

Add law tests for runtime invariants:

- replay reconstructs the same state
- rejected actions cause no external effects
- raw untrusted content cannot execute
- subagents cannot gain undelegated capabilities
- approval invalidates when evidence changes
- published claims require citations
- rollback preserves canonical history
- prompt compaction does not erase canonical state

Examples prove that cases work. Laws prove that classes of failures are
excluded.

## Avoid

Avoid:

- transcript-as-database
- hidden mutable agent state
- direct model-to-side-effect execution
- subagents with inherited parent authority
- approval represented as a permanent boolean
- raw tool output treated as instruction
- prompt summaries treated as truth
- deterministic workflows that remove useful model agency
- safety scattered across ad hoc guards
- tests that cover examples but not semantic laws

## Completion Standard

For a serious agentic implementation, leave behind:

- a runnable agent path
- an explicit action or tool surface
- semantic state or an event/audit log
- validation at consequential boundaries
- narrow effect interpreters
- replay or inspection support when the run is consequential
- at least one rejected-action example
- deterministic tests for state, projection, or validation
- at least one law or invariant test for the core boundary
- documentation of the semantic gates and remaining risks

The system should preserve the agent's freedom while making its consequential
behavior legible, testable, replayable, and bounded.
