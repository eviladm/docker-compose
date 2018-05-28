#!/bin/bash
#
# build.sh for my Dockerfiles (essence)
#
get_env() {
  if [[ ! -f ./project.env ]]; then 
    echo "project.evn missing, exiting"
    exit 1
  fi
  echo $(cat ./project.env)
}

get_version() {
  if [[ ! -f ./VERSION ]]; then 
    echo "VERSION file missing, exiting"
    exit 1
  fi
  echo $(cat ./VERSION)
}

env=$(get_env)
version=$(get_version)

# normal docker build
#docker build -t test:"$version" --build-arg "$env" . || echo 'build failed'
#exit 0
#

# compose build
[[ -f ./docker-compose.yaml ]] && docker-compose up
