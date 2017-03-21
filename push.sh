#!/bin/sh

LC=$(git rev-parse --short HEAD)
docker build -t seei/webapp:${LC} .
docker push seei/webapp:${LC}
