#! /usr/bin/env nix-shell
#! nix-shell --pure --keep CREDENTIALS_DIRECTORY -i dash -I channel:nixos-23.11-small -p nix dash sqlite gnused curl cacert flock bc coreutils inetutils gnugrep
set -eu

export LC_ALL=C # "fix" Nix Perl locale warnings

dash ./ping_collect.sh | sqlite3 -cmd ".timeout 90000" ./ping.db
