#!/bin/sh
set -x
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

mk_compose() {
cat <<EOT > ./docker-compose.yaml
version: '3'
services:
  essence:
    image: essence:${version}
    env_file:
      - project.env
    ports:
     - "8001-8010:8001-8010"
EOT
}

env=$(get_env)
version=$(get_version)

# image build
if [ $(docker build -t essence:"$version" --build-arg "$env" . >/dev/null 2>&1; echo $?) != 0 ]; then
  echo "build failed"
  exit 1
fi
#

# compose
if [ "$1" ]; then
  if [ "$1" == 'compose' ]; then
    mk_compose || exit 1
    if [ -f ./docker-compose.yaml ]; then
      docker-compose up
    fi
  fi
fi
