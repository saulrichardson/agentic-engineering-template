# Template Maintainer Guide

This repository is a Copier template for seeding new projects with reusable
guidance for autonomous coding agents.

Generated project files live under `template/`. Files outside `template/` are
maintainer files for this template repository and stay local to this repository.

## Core Doctrine

Preserve this doctrine across template changes:

```text
Autonomous coding agents are collaborators with initiative.
They inspect, decide, implement, test, document, and prepare delivery.
Their work leaves evidence: clear intent, coherent changes, useful checks,
deployment context, and decisions that future agents can understand.
```

Keep the template focused on principles, operating structure, project records,
and project-local customization points. Add framework code only when a reusable
project boundary genuinely needs it.

## Maintainer Rules

- Keep generated files portable across product domains.
- Prefer variables in `copier.yml` over hard-coded project identity.
- Keep `AGENTS.md.jinja` short enough that future agents read it.
- Put reusable doctrine in `docs/engineering/`.
- Put durable decisions, caveats, stack rationale, risks, operating notes,
  security assumptions, feature context, and lessons learned in `docs/records/`.
- Put architectural placement guidance in `docs/architecture/`.
- Put project-local specialization in `docs/project-profile.md`.
- Keep normal use free of submodule requirements.
- Keep Copier update compatibility intact.

## Verification

After editing the template, generate a temporary project from the current
worktree and run its local doctor check:

```bash
scripts/validate-template.sh
```

Then inspect the generated files for accidental template leakage.
