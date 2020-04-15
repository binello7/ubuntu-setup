#!/bin/bash

readarray -t words < persdict.dat

IFS=$'\n'
sorted=($(sort <<< "${words[*]}"))
unset IFS

printf "%s\n" "${sorted[@]}" > persdict.dat
