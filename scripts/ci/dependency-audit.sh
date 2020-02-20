#!/bin/bash

#===============================================================================
#
# AZ Quickstart composer dependency checks.
#
# https://github.com/sensiolabs/security-checker
#
#===============================================================================

EXIT_STATUS=0

if [[ -z ${1} ]]; then
  BASE_DIR='.'
else
  BASE_DIR="${1}"
fi

while read -r lockfile; do
  echo -e "\nchecking ${lockfile}\n"
  if ! security-checker security:check "${lockfile}"; then
    EXIT_STATUS=1
  fi
done < <(find "${BASE_DIR}" -name composer.lock)

exit ${EXIT_STATUS}
