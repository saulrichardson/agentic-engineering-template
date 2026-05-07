# Tool And Side-Effect Capability Registry

Every runtime-agent-facing or automation-facing tool must be registered here
before it is exposed to an LLM, agent runtime, workflow, MCP gateway, or other
side-effect capability boundary.

Broad tools require an ADR. Examples include arbitrary SQL, shell execution,
arbitrary HTTP, arbitrary file write, and arbitrary email send.

## Registry

| Tool name | Purpose | Input type | Output type | Allowed actors | Policy rule | Approval | Side effect | Idempotency key | Timeout | Audit event | Failure states |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| `searchAuthorizedDocuments` | Retrieve authorized context | `DocumentSearchInput` | `RetrievedContext[]` | workflow | `can_retrieve_document` | no | read only | request id | 10s | `document_retrieval_performed` | failed, denied |
| `createDraftEmail` | Create draft content without sending | `DraftEmailInput` | `DraftEmail` | workflow | `can_create_draft` | no | draft only | draft id | 10s | `draft_email_created` | failed, denied |

## Required Tool Fields

For each tool, define:

- purpose
- typed input
- typed output
- allowed actors
- policy rule
- approval requirement
- side effect
- idempotency behavior
- timeout
- audit event
- failure states

## Tool Rules

- tools must be narrow capabilities
- tool outputs are untrusted input
- tool errors must have typed failure states
- high-risk tools require approval or ADR-backed justification
- critical-risk tools require a threat model
