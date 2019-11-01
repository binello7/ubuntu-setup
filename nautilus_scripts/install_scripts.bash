#!/bin/bash

rsync -av *  ~/.local/share/nautilus/scripts/ --exclude=install_scripts.bash
