# Agentic Engineering Starter Pack

This repository is a small documentation starter pack for software projects
developed with autonomous coding agents.

The useful thing is the documentation under `starter/`. Copy it into a project,
make it local, and let it become the shared operating model for humans and
coding agents working in that repository.

## Core Idea

Coding agents work best when the repository gives them a small amount of stable
context:

- what the product is trying to become
- how the project works today
- how agents should interpret goals and make decisions
- what durable decisions, caveats, and lessons future agents should inherit

The starter keeps those ideas in four places:

```text
AGENTS.md              agent operating guide
docs/product-intent.md product north star
docs/approach.md       current project approach
docs/records/          durable project memory
```

## How To Use It

Copy the contents of `starter/` into a new or existing project.

Then replace the placeholders with the project's real context. The docs should
start simple and become more specific as the product, architecture, and working
model become clearer.

The copied docs are meant to be read and updated by coding agents as they work.
They should help agents act with initiative while staying grounded in the
project's actual goals, code, decisions, and constraints.

## What To Keep

Keep the starter small and general.

Prefer improving the four core surfaces over adding new documentation
categories. Add more structure only when it helps future agents understand the
project and make better decisions.

The goal is not to create a process manual. The goal is to give each project
enough shared context that coding agents can build, verify, document, and
deliver work without relying on hidden chat history.
