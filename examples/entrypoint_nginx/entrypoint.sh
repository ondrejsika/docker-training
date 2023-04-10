#!/bin/sh

if [ -z "$MESSAGE" ]; then
# The - option suppresses leading tabs but *not* spaces. :)
cat >&2 <<-EOF
Error: Environment variable MESSAGE is required.
EOF
exit 1
fi

echo "<h1>$MESSAGE</h1>" > /usr/share/nginx/html/index.html

exec "$@"
