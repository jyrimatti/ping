#!/bin/sh

export PING_HOST="$(cat "${CREDENTIALS_DIRECTORY:-.}/.ping-host")"