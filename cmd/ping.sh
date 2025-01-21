#! /usr/bin/env nix-shell
#! nix-shell --pure --keep CREDENTIALS_DIRECTORY -i dash -I channel:nixos-24.11-small -p nix dash coreutils inetutils gnugrep
set -eu

count="${1:-1}"
field="${2:-}" # 1|2|3|4

. ./ping_env.sh

ping -c "$count" -q "$PING_HOST"\
    | grep round-trip\
    | cut -d' ' -f 4\
    | { test -z "$field" && cat || cut -d'/' -f "$field"; }
