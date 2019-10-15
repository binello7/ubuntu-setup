#!/bin/bash

camera_folder=${NAUTILUS_SCRIPT_SELECTED_FILE_PATHS[0]}
camera_folder=${camera_folder//[$'\t\r\n']}
structure_array=(${camera_folder//// })
folder_levels=${#structure_array[@]}
camera=${structure_array[folder_levels-1]}
date=${structure_array[folder_levels-2]}
location=${structure_array[folder_levels-3]}

filename="${location}_${date}_${camera}"

mkdir Outputs
cd Outputs
mkdir "$camera"
cd "$camera"
camera_out="$PWD"

case $camera in
  rgb)
    mkdir dsm mesh mosaic point_cloud
    cp $camera_folder/${filename}/3_dsm_ortho/1_dsm/${filename}_dsm.* $camera_out/dsm
    cp $camera_folder/${filename}/3_dsm_ortho/2_mosaic/${filename}_* $camera_out/mosaic
    cp $camera_folder/${filename}/2_densification/3d_mesh/${filename}_* $camera_out/mesh
    cp $camera_folder/${filename}/2_densification/point_cloud/${filename}_* $camera_out/point_cloud
  ;;

  nir)
    mkdir reflectance
    cp $camera_folder/${filename}/4_index/reflectance/${filename}_group1.tif $camera_out/reflectance
  ;;

  vis)
    mkdir reflectance
    cp $camera_folder/${filename}/4_index/reflectance/${filename}_group1.tif $camera_out/reflectance
  ;;

  thermal)
    mkdir reflectance
    cp $camera_folder/${filename}/4_index/reflectance/${filename}_* $camera_out/reflectance
  ;;

  *)
    cd ../..
    touch pix4d_nautilus.log
    echo "An error occurred..." > pix4d_nautilus.log
  ;;
esac
