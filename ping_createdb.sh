#! /usr/bin/env nix-shell
#! nix-shell --pure
#! nix-shell -i dash -I channel:nixos-24.11-small -p dash sqlite
set -eu

sqlite3 ping.db < ping_create.sql