#!/bin/bash
set -e

declare -a packages=(
sway
wofi
kitty
firefox
neovim
fzf
ripgrep
ttf-cascadia-code-nerd
ruby
pavucontrol
guvcview
mako
waybar
wofi
wl-clipboard
btop
git
nvtop
mpv
swaybg
swayidle
swaylock
thunderbird
libreoffice
zola
)
sudo pacman -S --noconfirm `echo $(echo "${packages[@]}")`

sudo pacman -S --needed git base-devel
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd ..
rm -rf yay

yay -S --noconfirm powerline-shell

cp -rsf ~/dotfiles/config/* ~/.config
cp -sf ~/dotfiles/.bashrc ~
cp -sf ~/dotfiles/.gitconfig ~
