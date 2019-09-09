#!/bin/bash

# Run this script AFTER having installed apt packages. It performs their setup
echo "Enabling minimize on click..."
gsettings set org.gnome.shell.extensions.dash-to-dock click-action 'minimize'

echo "Adding hosts.txt to /etc/hosts"
sudo sed -i '/127.0.1.1/ r hosts.txt' /etc/hosts

echo "Add fancy coloring to git"
echo "force_color_prompt=yes" >> ~/.bashrc
cat gitconfig.txt >> ~/.gitconfig

echo "Enabling ssh-service..."
sudo systemctl enable ssh
sudo systemctl start ssh
