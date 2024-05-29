#! /usr/bin/env nix-shell
#! nix-shell --pure --keep LD_LIBRARY_PATH -i dash -I channel:nixos-23.11-small -p nix dash coreutils inetutils gnugrep
set -eu

count="${1:-1}"
field="${2:-}" # 1|2|3|4

ping -c "$count" -q "$(cat .ping-host)"\
    | grep round-trip\
    | cut -d' ' -f 4\
    | { test -z "$field" && cat || cut -d'/' -f "$field"; }
