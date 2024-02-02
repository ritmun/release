#!/bin/bash

set -o nounset
set -o errexit
set -o pipefail

if [[ -z "${CONFIGS}" ]]
then
    echo "CONFIGS is undefined. Set it and try again."
    exit 1
fi

if [[ -z "${SECRET_LOCATIONS}" ]]
then
    echo "SECRET_LOCATIONS is undefined. Set it and try again."
    exit 1
fi

CLUSTER_ID=""

if [[ -f "${SHARED_DIR}/cluster-id" ]];
then
    CLUSTER_ID=`cat ${SHARED_DIR}/cluster-id`
fi

export REPORT_DIR="${ARTIFACT_DIR}"

/osde2e test --configs "${CONFIGS}" \
--secret-locations "${SECRET_LOCATIONS}" \
--cluster-id "${CLUSTER_ID}"
