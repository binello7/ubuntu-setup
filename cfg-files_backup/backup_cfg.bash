#/bin/bash

folders=$(ls -d */)

for folder in $folders
do
  cd $folder
  bash *.bash
  cd ..
done
