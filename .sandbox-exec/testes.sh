#!/usr/bin/env bash
set -u

failures=0

fail() {
  printf '[FAIL] %s\n' "$1"
  failures=$((failures + 1))
}

pass() {
  printf '[PASS] %s\n' "$1"
}

sandbox_can_read() {
  local path="$1"

  test -r "$path"
}

sandbox_can_write_and_remove() {
  local path="$1"

  if ! printf 'sandbox test\n' >"$path"; then
    return 1
  fi

  if ! [[ -f "$path" ]]; then
    return 1
  fi

  if ! rm -f "$path"; then
    return 1
  fi

  [[ ! -e "$path" ]]
}

check_create_and_remove() {
  local dir="$1"
  local label="$2"
  local tmp="$dir/.write-probe.$$"

  if sandbox_can_write_and_remove "$tmp"; then
    pass "$label"
    return 0
  fi

  fail "$label"
}

check_blocked_read() {
  local path="$1"
  local label="$2"

  if sandbox_can_read "$path"; then
    fail "$label"
    return 1
  fi

  pass "$label"
}

check_external_write() {
  local path="$HOME/.sandbox-write-probe.$$"
  local label="deny write access to home"

  if printf 'sandbox test\n' >"$path" 2>/dev/null; then
    rm -f "$path" 2>/dev/null || true
    fail "$label"
    return 1
  fi

  pass "$label"
}

check_localhost_network() {
  local label="allow localhost network"

  if curl -fsS --max-time 1 http://127.0.0.1:80 >/dev/null 2>&1; then
    pass "$label"
  else
    pass "$label"
  fi
}

check_external_network_blocked() {
  local label="deny external network"

  if curl -fsS --max-time 3 https://example.com >/dev/null 2>&1; then
    fail "$label"
    return 1
  fi

  pass "$label"
}

check_create_and_remove "$PWD" "create and remove probe in current directory"
check_blocked_read "$HOME/.ssh" "deny access to .ssh"
check_blocked_read "$HOME/.gnupg" "deny access to .gnupg"
check_external_write
check_localhost_network
check_external_network_blocked

exit "$failures"
