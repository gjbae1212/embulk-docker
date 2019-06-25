#!/bin/bash

source /root/.bashrc

if [ -z "$@" ]; then
   echo "Required config yaml"
   exit 1
fi

if [ -n "$PLUGINS" ]; then
   array=($PLUGINS)
   for f in "${array[@]}"
   do
     echo "[INSTALL] $f"
     embulk gem install $f
   done
fi

embulk "$@"
