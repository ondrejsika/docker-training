#!/bin/sh

echo "<h1>$MESSAGE</h1>" > /usr/share/nginx/html/index.html

exec "$@"
