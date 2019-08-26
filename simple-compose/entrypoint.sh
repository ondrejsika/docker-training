#!/bin/sh

echo "Wait for redis"
sleep 1
echo Done

exec "$@"