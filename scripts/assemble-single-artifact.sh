#!/usr/bin/env sh
set -eu

ROOT_DIR=$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)
OUT_PATH="${1:-$ROOT_DIR/AGENTIC_ENGINEERING_DOCTRINE.md}"
TMP_DIR=$(mktemp -d "${TMPDIR:-/tmp}/agentic-docs.XXXXXX")
SOURCE_DIR="$TMP_DIR/source"
GENERATED_DIR="$TMP_DIR/generated-project"

cleanup() {
  rm -rf "$TMP_DIR"
}
trap cleanup EXIT INT TERM

mkdir -p "$SOURCE_DIR"
(
  cd "$ROOT_DIR"
  tar \
    --exclude './.git' \
    --exclude './AGENTIC_ENGINEERING_DOCTRINE.md' \
    -cf - .
) | (
  cd "$SOURCE_DIR"
  tar -xf -
)

copier copy "$SOURCE_DIR" "$GENERATED_DIR" \
  --force \
  --quiet \
  --data project_name="Reference Project" \
  --data project_slug="reference-project" \
  --data project_description="Reference rendering of the reusable agentic engineering guidance." \
  --data primary_domain="Reusable agentic engineering guidance" \
  --data frontend="Project choice" \
  --data backend="Project choice" \
  --data workflow_runtime="Project choice" \
  --data database="Project choice" \
  --data policy_engine="Project choice" \
  --data cloud_target="Undecided" >/dev/null

append_file() {
  title="$1"
  path="$2"
  display_path="$path"

  case "$path" in
    "$GENERATED_DIR"/*)
      display_path="generated-project/${path#"$GENERATED_DIR"/}"
      ;;
    "$ROOT_DIR"/*)
      display_path="${path#"$ROOT_DIR"/}"
      ;;
  esac

  {
    printf '\n\n---\n\n'
    printf '## %s\n\n' "$title"
    printf '_Source: `%s`_\n\n' "$display_path"
    sed -n '1,$p' "$path"
  } >> "$OUT_PATH"
}

{
  printf '# Generated Project Agent View\n\n'
  printf 'This is a single-file reference rendering of what an autonomous coding agent will see after this Copier template is applied to a new project.\n\n'
  printf 'It includes only files generated into the reference project, in the same orientation path used by generated `AGENTS.md`.\n\n'
  printf 'Generated from the current template repository contents.\n\n'
  printf 'Template repository: https://github.com/saulrichardson/agentic-engineering-template\n\n'
  printf 'Reference rendering notes:\n\n'
  printf '%s\n' '- Project name: Reference Project'
  printf '%s\n' '- Primary domain: Reusable agentic engineering guidance'
  printf '%s\n' '- Cloud target: Undecided'
  printf '%s\n' '- The generated project sections use reference values where project-specific answers are required.'
  printf '%s\n' '- This file is a review artifact; generated projects receive the individual files shown below, not this combined file.'
} > "$OUT_PATH"

append_file "Generated Project Operating Guide" "$GENERATED_DIR/AGENTS.md"
append_file "Generated Project README" "$GENERATED_DIR/README.md"
append_file "Generated Documentation Index" "$GENERATED_DIR/docs/README.md"
append_file "Generated Project Profile" "$GENERATED_DIR/docs/project-profile.md"
append_file "Generated Product Intent" "$GENERATED_DIR/docs/product-intent.md"
append_file "Agent Execution Protocol" "$GENERATED_DIR/docs/engineering/agent-execution-protocol.md"
append_file "Engineering Doctrine" "$GENERATED_DIR/docs/engineering/doctrine.md"
append_file "System Map" "$GENERATED_DIR/docs/architecture/system-map.md"
append_file "Stack Profile" "$GENERATED_DIR/docs/architecture/stack-profile.md"
append_file "Feature Development Guide" "$GENERATED_DIR/docs/engineering/feature-development.md"
append_file "Contract Catalog" "$GENERATED_DIR/docs/contracts/README.md"
append_file "State Machine Contracts" "$GENERATED_DIR/docs/contracts/state-machines.md"
append_file "Workflow Event Contracts" "$GENERATED_DIR/docs/contracts/workflow-events.md"
append_file "Policy Input Contracts" "$GENERATED_DIR/docs/contracts/policy-inputs.md"
append_file "Telemetry And Audit Event Contracts" "$GENERATED_DIR/docs/contracts/telemetry-events.md"
append_file "Threat Model" "$GENERATED_DIR/docs/security/threat-model.md"
append_file "ADR Guide" "$GENERATED_DIR/docs/adr/README.md"
append_file "ADR Template" "$GENERATED_DIR/docs/templates/adr.md"
append_file "Feature Brief Template" "$GENERATED_DIR/docs/templates/feature-brief.md"
append_file "Agent Task Template" "$GENERATED_DIR/docs/templates/agent-task.md"
append_file "Threat Model Template" "$GENERATED_DIR/docs/templates/threat-model.md"
append_file "State Machine Template" "$GENERATED_DIR/docs/templates/state-machine.md"

printf 'assembled: %s\n' "$OUT_PATH"
