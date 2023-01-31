#!/bin/sh

if [ -z "$MESSAGE" ]; then
		# The - option suppresses leading tabs but *not* spaces. :)
		cat >&2 <<-'EOE'
			Error: Environment variable MESSAGE is required.
		EOE
		exit 1
	fi

echo "<h1>$MESSAGE</h1>" > /usr/share/nginx/html/index.html

exec "$@"
