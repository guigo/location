#!/bin/bash
set -e

rm -f /location/tmp/pids/server.pid

yarn install --check-files

exec "$@"