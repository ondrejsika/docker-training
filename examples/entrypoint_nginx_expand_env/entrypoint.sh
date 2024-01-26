#!/bin/sh

goexpandenv /usr/share/nginx/html/index.html.envtemplate /usr/share/nginx/html/index.html

exec "$@"
