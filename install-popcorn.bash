sudo apt update && sudo apt install libcanberra-gtk-module libgconf-2-4
echo "Download Popcorn-Time from https://popcorntime.sh/"
sudo mkdir /opt/popcorn-time
cd ~/Programs
sudo tar Jxf Popcorn-Time-* -C /opt/popcorn-time
sudo ln -sf /opt/popcorn-time/Popcorn-Time /usr/bin/Popcorn-Time
sudo touch /usr/share/applications/popcorntime.desktop
echo \
"[Desktop Entry]
Version = 1.0
Type = Application
Terminal = false
Name = Popcorn Time
Exec = /usr/bin/Popcorn-Time
Icon = /opt/popcorn-time/src/app/images/icon.png
Categories = Application;" \
| sudo tee -a /usr/share/applications/popcorntime.desktop
echo "Popcorn-Time installed succesfully!"

