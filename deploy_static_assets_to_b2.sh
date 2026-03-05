#!/usr/bin/env bash

set -euo pipefail

if [[ $# -ne 2 ]]; then
  echo "Usage: $0 <bucket-name> <source-dir>" >&2
  exit 1
fi

BUCKET_NAME=$1
SOURCE_DIR=$2

# rclone remote name for Backblaze B2 must be configured beforehand.
# Example destination format: <remote>:<bucket>
DESTINATION="b2:$BUCKET_NAME"

if ! command -v rclone >/dev/null 2>&1; then
  echo "Error: rclone is not installed or not in PATH." >&2
  exit 1
fi

if [[ ! -d "${SOURCE_DIR}" ]]; then
  echo "Error: source directory not found: ${SOURCE_DIR}" >&2
  exit 1
fi

echo "Deploying ${SOURCE_DIR} -> ${DESTINATION}"
rclone sync "${SOURCE_DIR}" "${DESTINATION}" --progress
echo "Deployment complete."
