#!/bin/bash

jpgs=${NAUTILUS_SCRIPT_SELECTED_FILE_PATHS}

jpgs_dot=${jpgs// /$'.'}
jpgs_bslash=${jpgs// /$"\ "}

# rename the files if they contain spaces -> set them to "."
if [[ $jpgs == *" "* ]]
then
  readarray -t jpgs_dot_array <<< "$jpgs_dot"
  readarray -t jpgs_bslash_array <<< "$jpgs_bslash"

  last_idx=${#jpgs_bslash_array[@]}
  last_idx=$((last_idx - 1))

  unset jpgs_dot_array[$last_idx]
  unset jpgs_bslash_array[$last_idx]

  #rename the files by replacing " " with "."
  for i in "${!jpgs_bslash_array[@]}"
  do
    eval "mv ${jpgs_bslash_array[$i]} ${jpgs_dot_array[$i]}"
  done
  output=${jpgs_dot_array[0]}
  eval "convert ${jpgs_dot_array[@]} $output.pdf"
else
  readarray -t jpgs <<< "$jpgs"
  output=${jpgs[0]}
  eval "convert ${jpgs[@]} $output.pdf"
fi
