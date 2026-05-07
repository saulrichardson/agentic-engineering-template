# Agentic Engineering Template

This repository is the reusable doctrine and documentation template for
high-purity agentic applications.

It is designed to be copied into each project with Copier, then owned locally by
that project. It is not intended to be added as a git submodule.

## Why Copier

Copier gives this workflow the properties we need:

- generated projects get real local files
- each project can answer stack and domain questions
- `.copier-answers.yml` records the source template and answers
- future improvements can be pulled with `copier update`
- projects can specialize through ADRs without depending on submodule mechanics

## Create A New Project

From a local checkout:

```bash
copier copy /Users/saulrichardson/projects/agentic-engineering-template /path/to/new-project
```

From GitHub after this template is pushed:

```bash
copier copy gh:YOUR_ORG/agentic-engineering-template /path/to/new-project
```

For non-interactive generation:

```bash
copier copy gh:YOUR_ORG/agentic-engineering-template /path/to/new-project \
  --data project_name="New Project" \
  --data project_slug="new-project" \
  --data project_description="Short project description." \
  --data primary_domain="Project domain" \
  --data cloud_target="AWS"
```

## Update An Existing Project

Inside a generated project:

```bash
copier update
```

If the template source has moved from a local path to GitHub, update
`.copier-answers.yml` so `_src_path` points at the GitHub template before
running `copier update`.

## Template Layout

```text
copier.yml
template/
  AGENTS.md.jinja
  README.md.jinja
  .gitignore.jinja
  docs/
    project-profile.md.jinja
    engineering/
    architecture/
    adr/
    templates/
  scripts/
    doctor.sh.jinja
```

Files under `template/` are copied or rendered into generated projects. Files at
the repository root are for maintaining this template.

## Validate The Template

Run both default and minimal generation smoke tests:

```bash
scripts/smoke.sh
```

The smoke test creates temporary generated projects, then runs each generated
project's `scripts/doctor.sh`.

## Versioning

Tag template releases:

```bash
git tag v0.1.0
git push origin v0.1.0
```

Generated projects should update deliberately from tagged versions or a reviewed
branch.
