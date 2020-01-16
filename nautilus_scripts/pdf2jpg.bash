#!/bin/bash

pdfs=${NAUTILUS_SCRIPT_SELECTED_FILE_PATHS}
# IFS='.' # special bash variable: sets the separator that should be used

for pdf in ${pdfs[@]}
do
  readarray -d . -t splits <<< $pdf
  last_idx=${#splits[@]}
  last_idx=$((last_idx - 1))
  unset splits[$last_idx]

  IFS=. eval 'fname="${splits[*]}"'
  convert -density 150 $pdf $fname'.jpg'
done
