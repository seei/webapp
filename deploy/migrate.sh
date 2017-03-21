#!/bin/sh
set -x

LC=$(git rev-parse --short HEAD)

kubectl delete jobs/setup || true

sed "s/webapp:LAST_COMMIT/webapp:$LC/g" kube/jobs/setup-job.yaml > setup-job.yaml.tmp

kubectl create -f setup-job.yaml.tmp && rm setup-job.yaml.tmp
