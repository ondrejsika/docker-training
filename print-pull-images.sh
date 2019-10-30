#!/bin/sh

cat images.txt | xargs -n 1 echo docker pull
