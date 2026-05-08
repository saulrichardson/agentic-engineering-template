#!/usr/bin/env sh
set -eu

ROOT_DIR=$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)
CHECK_DIR="${1:-/tmp/agentic-template-check}"
TMP_DIR=$(mktemp -d "${TMPDIR:-/tmp}/agentic-template-source.XXXXXX")
SOURCE_DIR="$TMP_DIR/source"

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

rm -rf "$CHECK_DIR"

copier copy "$SOURCE_DIR" "$CHECK_DIR" \
  --force \
  --quiet \
  --data project_name="Template Check" \
  --data project_slug="template-check" \
  --data project_description="Temporary generated project for template validation." \
  --data primary_domain="Template validation" \
  --data frontend="PureScript" \
  --data cloud_target="Undecided"

"$CHECK_DIR/scripts/doctor.sh"
printf 'validated: %s\n' "$CHECK_DIR"
