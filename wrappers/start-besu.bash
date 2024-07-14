#!/bin/bash
set -eu

echo "=> Preparing the system  (${SNAP_REVISION})"

SERVICE_ARGS_FILE="$SNAP_COMMON/service-arguments"
BESU_BINARY_PATH="${SNAP}/bin/besu"

SERVICE_ARGS=$(<$SERVICE_ARGS_FILE)
eval "SERVICE_ARGS_ARRAY=($SERVICE_ARGS)"

echo "=> Service arguments: ${SERVICE_ARGS}"

exec "${BESU_BINARY_PATH}" "${SERVICE_ARGS_ARRAY[@]}"
