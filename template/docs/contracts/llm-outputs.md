# LLM Output Contracts

This file applies only when the product contains runtime LLM boundaries,
runtime agents, retrieval, planning, or model-generated outputs that affect
system behavior.

LLM output is data, not authority. Every LLM response used by the system must
map to an allowed output type and pass validation before it affects state,
policy, workflows, tools, or persistence.

## Allowed Output Variants

- `AnswerDraft`
- `ClarifyingQuestion`
- `PlanProposal`
- `ToolProposal`
- `Classification`
- `Extraction`
- `Summary`
- `Refusal`

## Required Fields Per LLM Boundary

For each LLM boundary, record:

- caller
- model or provider class
- input type
- output type
- allowed variants
- schema validator
- refusal behavior
- malformed-output behavior
- prompt-injection handling
- retention policy
- trace or audit event

## Boundary Registry

| Boundary | Input type | Output type | Allowed variants | Validator | Failure behavior | Trace event |
| --- | --- | --- | --- | --- | --- | --- |
| Reference planning call | `UserIntentContext` | `AgentPlanResult` | `PlanProposal`, `ClarifyingQuestion`, `Refusal` | schema validator | reject and ask clarification | `llm_plan_completed` |

## Rules

- malformed output is rejected safely
- model refusal is a valid output, not an exception
- retrieved context cannot override policy
- prompts must not contain secrets
- tool calls are proposals until policy, state, and approval checks pass
