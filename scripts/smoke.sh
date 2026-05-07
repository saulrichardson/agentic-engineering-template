#!/usr/bin/env sh
set -eu

ROOT_DIR=$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)
DEFAULT_OUT="${TMPDIR:-/tmp}/agentic-template-smoke"
MIN_OUT="${TMPDIR:-/tmp}/agentic-template-min"

rm -rf "$DEFAULT_OUT" "$MIN_OUT"

copier copy "$ROOT_DIR" "$DEFAULT_OUT" \
  --force \
  --vcs-ref=HEAD \
  --data project_name="Template Smoke Test" \
  --data project_slug="template-smoke-test" \
  --data project_description="Smoke test for the reusable engineering doctrine template." \
  --data primary_domain="Template validation" \
  --data cloud_target="Undecided"

"$DEFAULT_OUT/scripts/doctor.sh"

copier copy "$ROOT_DIR" "$MIN_OUT" \
  --force \
  --vcs-ref=HEAD \
  --data project_name="Minimal Template Test" \
  --data project_slug="minimal-template-test" \
  --data project_description="Minimal docs smoke test." \
  --data primary_domain="Template validation" \
  --data cloud_target="Undecided" \
  --data include_deployment_docs=false \
  --data include_formal_methods=false

"$MIN_OUT/scripts/doctor.sh"

printf 'smoke: ok\n'
