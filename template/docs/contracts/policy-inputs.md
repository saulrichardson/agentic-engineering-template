# Policy Input Contracts

Policy must be explicit and testable outside prompt text. This file records the
inputs policy decisions rely on.

## Authority Dimensions

- authenticated actor
- tenant or organization scope
- user role or membership
- agent delegation scope
- workflow identity
- tool capability
- resource ownership
- data sensitivity
- approval state
- environment

## Policy Decision Registry

| Decision | Input fields | Allowed result | Denied result | Audit event |
| --- | --- | --- | --- | --- |
| `can_start_agent_run` | actor, tenant, intent type | allow | deny | `policy_agent_run_checked` |
| `can_retrieve_document` | actor, tenant, document labels, task scope | allow | deny | `policy_retrieval_checked` |
| `can_execute_tool` | actor, workflow, tool, approval state | allow | deny | `policy_tool_execution_checked` |

## Rules

- default deny where practical
- frontend visibility is not authorization
- LLM output is not a policy input unless explicitly modeled as untrusted data
- policy decisions should be logged without leaking secrets
- approval is separate from authorization
