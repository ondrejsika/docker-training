#!/bin/sh

export REGISTRY=$1

cat images.txt | xargs -n 1 -I {} bash -c "docker pull $REGISTRY/{}; docker tag $REGISTRY/{} {}"
