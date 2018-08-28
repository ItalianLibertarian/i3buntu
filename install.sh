#!/bin/bash

#------------------------------------------------------------------#
#                          INSTALL i3BUNTU                         #
#------------------------------------------------------------------#


###### Place the default wallpaper in $HOME directory
#cp wallpaper.jpg ~/.wallpaper.jpg

###### Setup Ubuntu main and unofficial repositories as well as
###### other repositories which will simplify further installations
#cp -f sources.list ~/.sources.list

###### Update to the last package lists
#apt-get update # To get the latest package lists

declare -a packages=(
	"ubuntu-drivers-common"
	"ubuntu-restricted-extras"
	"ubuntu-docs"
	"ttf-ubuntu-font-family"
	"libnm-gtk-common"
	"ubuntu-wallpapers ubuntu-wallpapers-xenial"
	"openssh-client"
	"libstartup-notification0 upstart"
	"evince evince-common"
	"lightdm"
	"antoconf automake"
	"x11-xserver-utils"
	"arandr"
	"pavucontrol"
	"dconf dconf-tools"
	"python-gconf"
	"lxappearance"
	"policykit-desktop-privileges"
	"policykit-1-gnome"
	"vim vim-common"
	"thunar"
	"thunar-archive-plugin"
	"ranger"
	"mpv"
	"newsboat"
	"ntfs-3g"
	"youtube-dl"
	"youtube-viewer"
	"scrot"
	"gnome-system-monitor gnome-system-tools"
	"network-manager"
	"network-manager-gnome"
	"network-manager-openvpn"
	"network-manager-openvpn-gnome"
	"wireless-tools"
	"lightdm-gtk-greeter"
	"lightdm-gtk-greeter-settings"
	"overlay-scrollbar overlay-scrollbar-gtk2"
	"gnome-bluetooth"
	"libbluetooth3 libgnome-bluetooth13"
	"pulseaudio-module-bluetooth"
	"pulseaudio-module-x11"
	"totem-plugins gromit"
	"gstreamer1.0-pulseaudio"
	"transmission-gtk"
	"pactl xbacklight"
	"feh gnome-icon-theme-full"
	"rofi compton"
	"gnome-terminal"
	"gedit"
	"git"
	"i3 i3-wm i3blocks i3lock i3status"
	"xserver-xorg-video-intel"
	"acpi-support"
	"apport-gtk"
	"cups cups-bsd cups-client cups-filters"
	"foomatic-db-compressed-ppds"
	"openprinting-ppds"
	"bluez"
	"bluez-cups"
	"hplip"
	"printer-driver-brlaser printer-driver-c2esp"
	"printer-driver-foo2zjs"
	"printer-driver-gutenprint"
	"printer-driver-hpcups"
	"printer-driver-min12xxw"
	"printer-driver-pnm2ppa"
	"printer-driver-postscript-hp"
	"printer-driver-ptouch printer-driver-pxljr"
	"printer-driver-sag-gdi printer-driver-splix"
	"system-config-printer-gnome"
	"indicator-printers"
	"python3-aptdaemon.pkcompat"
	"evince evince-common"
	"libssh-4 libnm-glib-vpn1"
	"fonts-arphic-ukai fonts-arphic-uming"
	"fonts-dejavu-core fonts-freefont-ttf"
	"fonts-guru fonts-guru-extra fonts-kacst"
	"fonts-kacst-one fonts-khmeros-core"
	"fonts-liberation fonts-opensymbol"
	"fonts-nanum fonts-stix fonts-symbola"
	"xfonts-base xfonts-encodings"
	"xfonts-scalable xfonts-utils"
	"libxfont1 libfont-afm-perl"
	"libfontconfig1 libfontembed1"
	"libfontenc1 gnome-font-viewer"
	"fontconfig fontconfig-config"
	"dmz-cursor-theme libwayland-cursor0"
	"libxcursor1 xcursor-themes"
	"mousetweaks"
	"laptop-detect"
	"update-inetd update-notifier"
	"update-notifier-common"
	"usb-creator-common usb-creator-gtk"
	"gnome-power-manager"
	"libgsettings-qt1"
	"libproxy1-plugin-gsettings"
	"libappindicator3-1"
	"gir1.2-appindicator3-0.1 gdebi"
	"firefox"
	"vagrant"
	"zip"
);

###### Install main apps, drivers and dependencies

for package in "${packages[@]}"
do
	sudo apt-get install -y "$package"
done;

exit;


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
cp -f ~/i3buntu-master/configs/gtk/gtk-3.0/settings.ini ~/.config/gtk-3.0/settings.ini
cp -f ~/i3buntu-master/configs/gtk/.gtkrc-2.0 ~/.gtkrc-2.0
cp -f ~/i3buntu-master/configs/lightdm-gtk-greeter.conf /etc/lightdm/lightdm-gtk-greeter.conf
cp -f ~/i3buntu-master/configs/i3/config ~/.config/i3/config

###### Set appropriate user permissions
chown $(whoami):$(whoami) -R /home/$(whoami)/
chmod g+s /home/$(whoami)/
setfacl -d -m g::rwx /home/$(whoami)/
setfacl -d -m o::rx /home/$(whoami)/
