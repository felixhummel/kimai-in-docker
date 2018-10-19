#!/bin/bash
set -euo pipefail

vols=$(docker volume ls -q --filter label=de.felixhummel.project=kimai)

if [[ -z $vols ]]; then
  echo no volumes found >&2
  exit 1
fi

docker volume rm $vols
