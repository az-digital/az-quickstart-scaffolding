#!/bin/bash
#
# Set the requested quickstart branch of the quickstart composer package.

# Default to the master branch.
BRANCH="master"

# Parse options
while (( "$#" )); do
  case "$1" in
    --branch|--branch=*)
      if [ "${1##--branch=}" != "$1" ]; then
        BRANCH="${1##--branch=}"
        shift
      else
        BRANCH=$2
        shift 2
      fi
      ;;
    -*|--*=)
      echo "Error: Unsupported flag $1" >&2
      exit 1
      ;;
    *)
      shift
      ;;
  esac
done

# Compute the expected composer package name of the requested branch.
BRANCH="dev-${BRANCH}"

# Install and fetch dependencies for the requested branch
composer require "az-digital/az_quickstart:$BRANCH"
