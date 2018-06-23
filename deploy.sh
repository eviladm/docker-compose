#!/bin/bash
#
# deploy to environments
#



environment=$1
image=$2

if [ "$#" -ne 2 ];then
  echo env and image missing
  exit 1
fi

staging() {
  if [ "$environment" == 'staging' ];then
    echo deploy stating
  fi

}

production() {
  if [ "$environment" == 'production' ];then
    echo deploy prod
  fi
}



