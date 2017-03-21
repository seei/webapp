#!/bin/sh
set -x

LC=$(git rev-parse --short HEAD)
docker build -f Dockerfile -t seei/webapp:${LC} .
docker push seei/webapp:${LC}
kubectl set image deployment webapp webapp=seei/webapp:${LC}
