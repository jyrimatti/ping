#! /usr/bin/env nix-shell
#! nix-shell --pure -i dash -I channel:nixos-23.11-small -p nix gnused dash bc coreutils inetutils gnugrep
set -eu

stamp="$(date +%s)"

ping="$(./cmd/ping.sh 20)"

echo "$ping" | cut -d'/' -f1 | { read -r d; echo "[$stamp,$d]"; } | dash ./ping_convert.sh "min"
echo "$ping" | cut -d'/' -f2 | { read -r d; echo "[$stamp,$d]"; } | dash ./ping_convert.sh "avg"
echo "$ping" | cut -d'/' -f3 | { read -r d; echo "[$stamp,$d]"; } | dash ./ping_convert.sh "max"
echo "$ping" | cut -d'/' -f4 | { read -r d; echo "[$stamp,$d]"; } | dash ./ping_convert.sh "stddev"
