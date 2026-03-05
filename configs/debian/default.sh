#!/bin/bash
#
# debian default config
# TODO: reorganize after testing

# package installation
apt install -y \
bash bash-completion shellcheck fzf

apt install -y \
micro hx mc

apt install -y \
curl wget

apt install -y \
git gh

apt install -y \
sed gawk grep ripgrep

apt install -y \
python3-full python3-pip

apt install -y \
npm

apt install -y \
screen tmux mc

apt install -y \
kitty

# npm packages
npm install -g npm@latest

npm install -g bash-language-server

# git config

echo_info "git un+um system"
git config --system user.name "Riabinin Olexandr Serhiyovych" && echo "OK sun"
git config --system user.email "riabininos@gmail.com" && echo "OK sum"

echo_info "git un+um ug"
sudo -u "riabininos" git config --global user.name "Riabinin Olexandr Sergiyovych" && echo "OK ugun"
sudo -u "riabininos" git config --global user.email "riabininos@gmail.com" && echo "OK ugum"

git config --system core.editor hx
sudo -u "riabininos" git config --global core.editor hx

