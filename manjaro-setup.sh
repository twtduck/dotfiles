#!/bin/bash
echo "Removing firefox"
sudo pacman -R --noconfirm firefox
rm -rv ~/.mozilla
rm -v .ff-theme-util_1strun
echo "Installing vim"
sudo pacman -S --noconfirm vim
echo "Installing yaourt"
sudo pacman -S --noconfirm yaourt
echo "Creating temporary directory yaourt-tmp"
mkdir -v yaourt-tmp
echo "Installing anaconda from AUR"
yaourt -S --noconfirm --tmp yaourt-tmp anaconda 
echo "Nightly anaconda from AUR"
gpg --recv-key 0x61B7B526D98F0353
yaourt -S --noconfirm --tmp yaourt-tmp firefox-nightly
echo "Removing tempororary installation files"
rm -r yaourt-tmp
echo "Configuring pamac"
sudo mv -v /etc/pamac.conf /etc/pamac.conf.bak
sudo cp -v pamac.conf /etc/pamac.conf
echo "Setting custom xfce4 keyboard shortcuts"
mv -v ~/.config/xfce4/xfconf/xfce-perchannel-xml/xfce4-keyboard-shortcuts.xml ~/.config/xfce4/xfconf/xfce-perchannel-xml/xfce4-keyboard-shortcuts.xml.bak
cp -v xfce4-keyboard-shortcuts.xml ~/.config/xfce4/xfconf/xfce-perchannel-xml/
echo "Installing arc-themes-maia"
sudo pacman -S --noconfirm arc-themes-maia
echo "Setting theme"
cp -fv xsettings.xml ~/.config/xfce4/xfconf/xfce-perchannel-xml/xsettings.xml
cp -fv xfwm4.xml ~/.config/xfce4/xfconf/xfce-perchannel-xml/xfwm4.xml
echo "Installing wget"
sudo pacman -S --noconfirm wget
echo "Installing otf-overpass (font)"
sudo pacman -S --noconfirm otf-overpass
echo "Setting terminal preferences"
mv -v ~/.config/xfce4/terminal/terminalrc ~/.config/xfce4/terminal/terminalrc.bak
cp -v xfce4-terminalrc ~/.config/xfce4/terminal/terminalrc
echo "Downloading wallpaper"
wget http://klowner.com/wallery/when_it_rains/download/WhenItRains5120x2880.svg -O ~/Pictures/.wallpaper.svg
echo "Setting wallpaper"
cp -fv xfce4-desktop.xml ~/.config/xfce4/xfconf/xfce-perchannel-xml 
echo "Configure git"
git config --global user.name "Thomas Woltjer"
git config --global user.email "thomaswoltjer@gmail.com"
