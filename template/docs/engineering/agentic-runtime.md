# Agentic Runtime Guidance

This document applies when the product itself contains LLMs, runtime agents,
retrieval, planning, or tool use.

It is a specialization of the general engineering doctrine. Runtime agents
inside the product must be contained by the same boundaries that guide
autonomous coding agents during development.

## Runtime Rule

```text
LLMs may propose actions.
Only typed, verified, policy-checked, durable workflows may execute actions.
```

LLM output is data, not authority.

## Allowed Runtime Agent Outputs

An LLM or runtime agent may return typed objects such as:

- `AnswerDraft`
- `ClarifyingQuestion`
- `PlanProposal`
- `ToolProposal`
- `Classification`
- `Extraction`
- `Summary`
- `Refusal`

It must not directly execute unchecked mutations.

## Runtime Agent Flow

```text
user intent
  -> typed intent object
  -> runtime agent proposes plan
  -> plan is parsed into typed command candidates
  -> policy checks authority
  -> state machine checks validity
  -> approval is requested when required
  -> workflow executes durable steps
  -> database records state change
  -> outbox or tool gateway performs side effects
  -> telemetry records the full trace
```

The agent proposes. The system decides and executes.

## Tool Proposals

Tool proposals must be:

- parsed
- schema validated
- policy checked
- state checked
- approval checked when required
- recorded before execution
- executed through a narrow capability
- audited after execution

Avoid broad runtime-agent tools:

- `run_sql`
- `execute_shell`
- `http_request`
- `send_any_email`
- `write_any_file`

Prefer narrow capabilities:

- `searchAuthorizedDocuments`
- `createDraftEmail`
- `submitApprovedTicket`
- `lookupOrderStatus`
- `scheduleApprovedCalendarEvent`

Every runtime-agent-facing tool belongs in `docs/contracts/tool-registry.md`.

## Retrieval

Retrieval is controlled access to information, not informal prompt stuffing.

The system must ensure:

- the user may access retrieved documents
- the runtime agent may use those documents for this task
- retrieved text cannot override system policy
- document sources are traceable
- sensitive data is handled intentionally
- retrieval events are logged

Retrieved context and external documents are untrusted input.

## Prompt Injection And Tool Results

Tool outputs, webpages, documents, emails, PDFs, and external API responses can
contain instructions hostile to the system.

Runtime agents must not treat those results as authority. Tool results can
inform the next proposal, but they cannot modify policy, approval, credentials,
state transitions, or allowed tool capabilities.

## Approval

High-risk runtime actions require explicit approval. Approval is separate from
authorization.

Approval rules should define:

- what action requires approval
- who may approve it
- how long approval lasts
- what exact proposal was approved
- what happens when approval is denied or expires
- what audit event records the decision

## Required Runtime Contracts

When adding runtime agents, update the relevant contract docs:

- `docs/contracts/llm-outputs.md`
- `docs/contracts/tool-registry.md`
- `docs/contracts/state-machines.md`
- `docs/contracts/workflow-events.md`
- `docs/contracts/policy-inputs.md`
- `docs/contracts/telemetry-events.md`
- `docs/security/threat-model.md`

## Verification

Runtime-agent changes should test:

- schema validation
- malformed output
- refusal path
- prompt-injection path
- unauthorized retrieval
- denied policy decision
- approval required
- duplicate tool callback
- idempotency or compensation
- audit and trace output
