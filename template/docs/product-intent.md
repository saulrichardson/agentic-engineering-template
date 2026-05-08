# Product Intent

This is the project-owned place for describing what the product is actually
trying to become.

Use it for raw thoughts, product narrative, desired functionality, workflow
ideas, runtime-agent behavior, constraints, examples, open questions, and notes
that are not yet ready to become formal contracts or ADRs.

This file may be messy while the product is still being understood. It should
be useful to humans and coding agents trying to understand the goal behind the
work.

## Raw Notes

Add unstructured thoughts here.

- <note>

## Product Narrative

What are we building, for whom, and why?

## Desired Functionality

What should the product let users do?

## Users And Jobs

Who uses this system, and what job are they trying to get done?

## Runtime Agent Role

If the product contains runtime agents or LLMs, what role should they play?

What should they never decide or do?

## Core Workflows

What are the most important end-to-end workflows?

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
  stack choices, invariants, and non-goals
- `docs/templates/feature-brief.md` for a specific feature before implementation
- `docs/adr/` for architecture, stack, policy, persistence, or workflow decisions
- `docs/contracts/` for state machines, policy inputs, tool capabilities,
  workflow events, telemetry events, and runtime-agent outputs
- `docs/security/threat-model.md` for security and abuse-risk assumptions

Coding agents may use this file to understand intent, but this file is not by
itself an execution contract. Important behavior should be promoted into the
project profile, contracts, feature briefs, tests, or ADRs before implementation
depends on it.
