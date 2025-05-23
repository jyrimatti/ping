#! /usr/bin/env nix-shell
#! nix-shell --pure
#! nix-shell -i dash -I channel:nixos-24.11-small -p dash rsync sqlite openssh
set -eu

remoteuser=$1
remotehost=$2
remotefile=$3

{
    echo 'PRAGMA locking_mode = EXCLUSIVE;'
    echo 'BEGIN EXCLUSIVE;'
    rsync -avzq --bwlimit=1000 -e "ssh -qo StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null" ./ping.db "$remoteuser@$remotehost:$remotefile" 1>&2
    echo 'COMMIT;'
    echo '.quit'
} | sqlite3 ./ping.db
