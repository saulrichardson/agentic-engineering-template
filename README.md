# Agentic Engineering Starter Pack

This repository is a small documentation starter pack for software projects
developed with autonomous coding agents.

The useful thing is the agent operating context under `starter/`. Copy that
context into a project, make it local, and let it become the shared operating
model for humans and coding agents working in that repository.

The docs should preserve not only what the project does, but what kind of
product it is trying to become, so future agents do not collapse an ambitious
product direction into a smaller familiar implementation pattern.

## Core Idea

Coding agents work best when the repository gives them a small amount of stable
context:

- what the product is trying to become
- how the project works today
- how agents should interpret goals and make decisions
- what durable decisions, caveats, and lessons future agents should inherit

The starter keeps those ideas in four copied surfaces:

```text
AGENTS.md              agent operating guide
docs/product-intent.md product north star
docs/approach.md       current project approach
docs/records/          durable project memory
```

## How To Use It

Copy only the agent operating context into a new or existing project:

```text
starter/AGENTS.md -> AGENTS.md
starter/docs/     -> docs/
```

Do not copy this repository's README into the project. A project README should
be written for the actual project: what it is, how to run it, how to use it, and
how to operate it.

After copying the starter context, replace the placeholders with the project's
real context. The docs should start simple and become more specific as the
product, architecture, and working model become clearer.

The copied docs are meant to be read and updated by coding agents as they work.
They should help agents act with initiative while staying grounded in the
project's actual goals, code, decisions, and constraints.

## What To Keep

Keep the starter small and general.

Prefer improving the copied operating context over adding new documentation
categories. Add more structure only when it helps future agents understand the
project and make better decisions.

The goal is not to create a process manual. The goal is to give each project
enough shared context that coding agents can build, verify, document, and
deliver work without relying on hidden chat history.
