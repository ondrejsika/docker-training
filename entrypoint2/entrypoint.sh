#!/bin/sh

echo "<h1>${DATA:-HelloWorld}</h1>" > /usr/share/nginx/html/index.html
echo "Starting ..."

exec "$@"
