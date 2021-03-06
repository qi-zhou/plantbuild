#!/usr/bin/env sh

set -o errexit
set -o nounset
set -o pipefail

if ! find . -name '*.jsonnet' -exec jsonnet fmt --test '{}' +
then
  echo "ERROR: found unformatted jsonnet files. Fix with hack/update-jsonnet.sh"
  exit 1
fi
