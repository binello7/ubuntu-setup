#!/bin/bash

folder=$1
n_sel=$2

cd $folder
mkdir rand
elements=($(ls frame_*))

for ((i=0; i<$n_sel; i++))
do
  r=$(( $RANDOM % ${#elements[@]} ))
  cp ${elements[r]} rand/
done
