#!/bin/bash

#------------------------------------------------------------------#
#                          INSTALL i3BUNTU                         #
#------------------------------------------------------------------#


###### Setup Ubuntu main and unofficial repositories as well as
###### other repositories which will simplify further installations
cp -f sources.list ~/.sources.list

###### Update to the last package lists
apt-get update 

apt-get install -y ubuntu-drivers-common
apt-get install -y ubuntu-restricted-extras
apt-get install -y ubuntu-docs
apt-get install -y ttf-ubuntu-font-family
apt-get install -y libnm-gtk-common
apt-get install -y ubuntu-wallpapers ubuntu-wallpapers-xenial
apt-get install -y openssh-client
apt-get install -y libstartup-notification0
apt-get install -y evince evince-common
apt-get install -y lightdm
apt-get install -y antoconf automake
apt-get install -y x11-xserver-utils
apt-get install -y arandr
apt-get install -y pavucontrol
apt-get install -y dconf dconf-tools
apt-get install -y python-gconf
apt-get install -y lxappearance
apt-get install -y policykit-desktop-privileges
apt-get install -y policykit-1-gnome
apt-get install -y vim vim-common
apt-get install -y nautilus
apt-get install -y ranger
apt-get install -y mpv
apt-get install -y newsboat
apt-get install -y ntfs-3g
apt-get install -y youtube-dl
apt-get install -y youtube-viewer
apt-get install -y scrot
apt-get install -y gnome-system-monitor gnome-system-tools
apt-get install -y network-manager
apt-get install -y network-manager-gnome
apt-get install -y network-manager-openvpn
apt-get install -y network-manager-openvpn-gnome
apt-get install -y wireless-tools
apt-get install -y lightdm-gtk-greeter
apt-get install -y lightdm-gtk-greeter-settings
apt-get install -y overlay-scrollbar overlay-scrollbar-gtk2
apt-get install -y gnome-bluetooth
apt-get install -y libbluetooth3 libgnome-bluetooth13
apt-get install -y pulseaudio-module-bluetooth
apt-get install -y pulseaudio-module-x11
apt-get install -y totem-plugins gromit
apt-get install -y gstreamer1.0-pulseaudio
apt-get install -y transmission-gtk
apt-get install -y pactl xbacklight
apt-get install -y feh gnome-icon-theme-full
apt-get install -y rofi compton
apt-get install -y gedit
apt-get install -y git
apt-get install -y i3 i3-wm i3blocks i3lock i3status
apt-get install -y xserver-xorg-video-intel
apt-get install -y acpi-support
apt-get install -y apport-gtk
apt-get install -y cups cups-bsd cups-client cups-filters
apt-get install -y foomatic-db-compressed-ppds
apt-get install -y openprinting-ppds
apt-get install -y bluez
apt-get install -y bluez-cups
apt-get install -y hplip
apt-get install -y printer-driver-brlaser printer-driver-c2esp
apt-get install -y printer-driver-foo2zjs
apt-get install -y printer-driver-gutenprint
apt-get install -y printer-driver-hpcups
apt-get install -y printer-driver-min12xxw
apt-get install -y printer-driver-pnm2ppa
apt-get install -y printer-driver-postscript-hp
apt-get install -y printer-driver-ptouch printer-driver-pxljr
apt-get install -y printer-driver-sag-gdi printer-driver-splix
apt-get install -y system-config-printer-gnome
apt-get install -y indicator-printers
apt-get install -y python3-aptdaemon.pkcompat
apt-get install -y evince evince-common
apt-get install -y libssh-4 libnm-glib-vpn1
apt-get install -y fonts-arphic-ukai fonts-arphic-uming
apt-get install -y fonts-dejavu-core fonts-freefont-ttf
apt-get install -y fonts-guru fonts-guru-extra fonts-kacst
apt-get install -y fonts-kacst-one fonts-khmeros-core
apt-get install -y fonts-liberation fonts-opensymbol
apt-get install -y fonts-nanum fonts-stix fonts-symbola
apt-get install -y xfonts-base xfonts-encodings
apt-get install -y xfonts-scalable xfonts-utils
apt-get install -y libxfont1 libfont-afm-perl
apt-get install -y libfontconfig1 libfontembed1
apt-get install -y libfontenc1 gnome-font-viewer
apt-get install -y fontconfig fontconfig-config
apt-get install -y dmz-cursor-theme libwayland-cursor0
apt-get install -y libxcursor1 xcursor-themes
apt-get install -y mousetweaks
apt-get install -y thunar
apt-get install -y laptop-detect
apt-get install -y update-inetd update-notifier
apt-get install -y update-notifier-common
apt-get install -y usb-creator-common usb-creator-gtk
apt-get install -y gnome-power-manager
apt-get install -y libgsettings-qt1
apt-get install -y libproxy1-plugin-gsettings
apt-get install -y libappindicator3-1
apt-get install -y gir1.2-appindicator3-0.1 gdebi
apt-get install -y firefox
apt-get install -y virtualbox
apt-get install -y zip
apt-get install -y gparted
apt-get install -y baobab

###### Install main apps, drivers and dependencies

for package in "${packages[@]}"
do
	sudo apt-get install -y "$package"
done;

##### Get and install infinality (better font rendering)
add-apt-repository ppa:no1wantdthisname/ppa -y
apt-get update
apt-get upgrade -y
apt-get install -y fontconfig-infinality

###### Get and install playerctl
wget 'https://github.com/acrisci/playerctl/releases/download/v0.5.0/playerctl-0.5.0_amd64.deb'
dpkg -i playerctl-0.5.0_amd64.deb
rm -rf playerctl-0.5.0_amd64.deb

###### Remove old versions of the Arc theme
rm -rf /usr/share/themes/{Arc,Arc-Darker,Arc-Dark}
rm -rf ~/.local/share/themes/{Arc,Arc-Darker,Arc-Dark}
rm -rf ~/.themes/{Arc,Arc-Darker,Arc-Dark}

###### Get and install the latest Arc theme
wget http://download.opensuse.org/repositories/home:Horst3180/xUbuntu_16.04/Release.key
apt-key add - < Release.key
sh -c "echo 'deb http://download.opensuse.org/repositories/home:/Horst3180/xUbuntu_16.04/ /' >> /etc/apt/sources.list.d/arc-theme.list"
apt-get update
apt-get install -y arc-theme

###### Make .fonts directory if not already available
mkdir ~/.fonts

###### Get and install San Francisco Font
git clone https://github.com/supermarin/YosemiteSanFranciscoFont.git
cp -v YosemiteSanFranciscoFont/*.ttf ~/.fonts
rm -rf YosemiteSanFranciscoFont

###### Get and install Font Awesome Web Font
git clone https://github.com/FortAwesome/Font-Awesome.git
cp -v Font-Awesome/fonts/*.ttf ~/.fonts
rm -rf Font-Awesome

###### Get and install Moka icon theme
add-apt-repository ppa:moka/daily -y
apt-get update
apt-get install -y moka-icon-theme

###### Make config directories
mkdir ~/.config
mkdir ~/.config/gtk-3.0
mkdir ~/.config/i3

###### Create directories inside $HOME
mkdir ~/Documents ~/Downloads ~/Music ~/Pictures ~/Videos

###### Apply GTK theme, fonts, icon theme, login greeter
###### and i3
cp -f ~/i3buntu/configs/gtk/gtk-3.0/settings.ini ~/.config/gtk-3.0/settings.ini
cp -f ~/i3buntu/configs/gtk/.gtkrc-2.0 ~/.gtkrc-2.0
cp -f ~/i3buntu/configs/lightdm-gtk-greeter.conf /etc/lightdm/lightdm-gtk-greeter.conf
cp -f ~/i3buntu/configs/i3/config ~/.config/i3/config
cp -f ~/i3buntu/Xresources ~/.Xresources
cp -f ~/i3buntu/bashrc ~/.bashrc
cp -f ~/i3buntu/bash_aliases ~/.bash_aliases

## Vim
cp -f ~/i3buntu/configs/vim/vimrc ~.vimrc
mkdir ~/.vim
mkdir ~/.vim/colors/
cp -f ~/i3buntu/configs/vim/colors/thinkpad.vim ~/.vim/colors/

###### Set appropriate user permissions
chown $(whoami):$(whoami) -R /home/$(whoami)/
chmod g+s /home/$(whoami)/
setfacl -d -m g::rwx /home/$(whoami)/
setfacl -d -m o::rx /home/$(whoami)/
