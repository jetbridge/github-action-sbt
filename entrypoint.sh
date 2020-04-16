#!/bin/bash

set -x
cd "$INPUT_SBT_PROJECT_DIRECTORY"

set +x
if [ ! -f build.sbt ] ; then
  echo "No build.sbt present, exiting"
  exit -1
fi

if [ ! -d ./project/ ] ; then
  mkdir project
fi

echo "+ writing ./github_action_sbt_settings.sbt"
echo "${INPUT_SETTINGS_SBT}" > ./github_action_sbt_settings.sbt

set -x
/usr/bin/sbt ${@}

#echo ::set-output name=time::$time
