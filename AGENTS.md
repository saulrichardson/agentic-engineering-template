# Template Maintainer Guide

This repository is a Copier template for seeding new projects with a reusable
engineering doctrine for high-purity agentic software.

Generated project files live under `template/`. Files outside `template/` are
for maintaining this template repository and are not copied into generated
projects.

## Core Boundary

Preserve this doctrine across template changes:

```text
LLMs may propose actions.
Only typed, verified, policy-checked, durable workflows may execute actions.
```

Do not turn the template into a framework scaffold unless a real boundary needs
that code. This repository should seed principles, operating structure, decision
records, and project-local customization points.

## Maintainer Rules

- Keep generated files portable across product domains.
- Prefer variables in `copier.yml` over hard-coded project identity.
- Keep `AGENTS.md.jinja` short enough that future agents read it.
- Put reusable doctrine in `docs/engineering/`.
- Put architectural maps and stack defaults in `docs/architecture/`.
- Put project-local specialization in `docs/project-profile.md`.
- Use ADRs for decisions that future agents might reasonably question.
- Do not require submodules for normal use.
- Keep Copier update compatibility intact.

## Verification

After editing the template, run:

```bash
scripts/smoke.sh
```

Then inspect the generated files for accidental template leakage.
