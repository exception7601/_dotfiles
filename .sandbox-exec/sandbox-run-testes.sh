#!/usr/bin/env bash
set -u

sandbox="/Users/anderson/Developer/_dotfiles/.sandbox-exec/config.sb"
if [[ ! -f "$sandbox" ]]; then
  echo "sandbox file not found: $sandbox" >&2
  exit 1
fi

exec sandbox-exec -D PWD="$PWD" -f "$sandbox" "$PWD/.sandbox-exec/testes.sh" "$@"
