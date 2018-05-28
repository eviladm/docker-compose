#!/bin/bash
#
# monitor my essence stuff - super simple return code
#
set -x
source project.env

am_i_running() {
 echo 'should check that, pidfile or smg'
}

port=$PORT

while true; do
  ret=$(curl -m 3 -sI localhost:"$port" | egrep "HTTP.*\d\d\d")
  if [[ ! $ret = *"200"* ]]; then
    echo 'not running - restarting'
    if [ $(docker-compose up -d >/dev/null 2>&1 && echo 0) != 0 ]; then
      echo 'restarting failed'
      exit 1
    else source project.env
    fi 
  fi
  sleep 5
done
