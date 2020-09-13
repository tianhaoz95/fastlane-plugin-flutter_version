#!/bin/bash

set -o pipefail

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
PROJ_ROOT="$(dirname "$SCRIPT_DIR")"

DOC_README="$PROJ_ROOT/docs/README.md"
MAIN_README="$PROJ_ROOT/README.md"

if cmp -s "$MAIN_README" "$DOC_README"
then
  echo "Content in $MAIN_README and $DOC_README are the same. Done."
else
  echo "ERROR: content in $MAIN_README and $DOC_README are different."
  exit 1
fi