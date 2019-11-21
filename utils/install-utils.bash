#!/bin/bash

utils=($(ls))

for util in ${utils[@]}
do
  if [[ $util != "install-utils.bash" ]]
  then
    sudo ln -s $PWD/$util /usr/bin/
  fi
done
