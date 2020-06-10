#!/bin/sh

cd "$(dirname $0)"
rm -rf .git/hooks
cd .git
ln -s ../.git-hooks hooks
