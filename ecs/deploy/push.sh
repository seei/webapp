#!/bin/sh
set -x

LC=$(git rev-parse --short HEAD)
docker build -f Dockerfile -t seei/webapp:${LC}
docker push seei/webapp:${LC}

sed "s/webapp:LAST_COMMIT/webapp:$LC/g" ecs/task-definitions/webapp.json > webapp.json.tmp

aws ecs register-task-definition --cli-input-json file://webapp.json.tmp && rm webapp.json.tmp

aws ecs update-service --service webapp-service --task-definition webapp --desired-count 1 --cluster ecs-cluster
