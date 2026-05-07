# Template Maintainer Guide

This repository is a Copier template for seeding new projects with a reusable
engineering doctrine for high-integrity software developed with autonomous
coding agents.

Generated project files live under `template/`. Files outside `template/` are
for maintaining this template repository and are not copied into generated
projects.

## Core Boundary

Preserve this doctrine across template changes:

```text
Autonomous agents may propose code, plans, and actions.
The system may accept them only through explicit boundaries:
typed inputs, domain rules, policy checks, review gates, state transitions,
tests, durable persistence, controlled side effects, and observable execution.
```

Runtime LLM guidance is a specialization of this broader doctrine, not the whole
scope of the template.

Do not turn the template into a framework scaffold unless a real boundary needs
that code. This repository should seed principles, operating structure, decision
records, and project-local customization points.

## Maintainer Rules

- Keep generated files portable across product domains.
- Prefer variables in `copier.yml` over hard-coded project identity.
- Keep `AGENTS.md.jinja` short enough that future agents read it.
- Put reusable doctrine in `docs/engineering/`.
- Put operational contracts in `docs/contracts/`.
- Put threat-model guidance in `docs/security/` and templates in `docs/templates/`.
- Put architectural maps and stack defaults in `docs/architecture/`.
- Put project-local specialization in `docs/project-profile.md`.
- Use ADRs for decisions that future agents might reasonably question.
- Do not require submodules for normal use.
- Keep Copier update compatibility intact.

## Verification

After editing the template, generate a temporary project from the current
worktree and run its local doctor check:

```bash
scripts/validate-template.sh
```

Then inspect the generated files for accidental template leakage.
