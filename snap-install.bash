#!/bin/bash

snap_pkgs=(
  'atom --classic'
  'skype --classic'
  'zoom-client'
)

for ((i=0; i<${#snap_pkgs[@]}; i++))
do
  sudo snap install ${snap_pkgs[$i]}
done

echo -e "\nInstall of snap-packages finished"
