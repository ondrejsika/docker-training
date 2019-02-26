#!/bin/sh

docker image ls --format '{{.Repository}}:{{.Tag}}' | sort > images.txt