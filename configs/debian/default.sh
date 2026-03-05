#!/bin/bash
#
# debian default config
# TODO: reorganize after testing

# package installation
apt install -y \
  bash bash-completion shellcheck shfmt fzf

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
  kitty \
  powerline powerline-doc powerline-gitstatus

# npm packages
npm install -g npm@latest

npm install -g bash-language-server

# git config

git config --system user.name "Riabinin Olexandr Serhiyovych"
git config --system user.email "riabininos@gmail.com"

sudo -u "riabininos" git config --global user.name "Riabinin Olexandr Sergiyovych"
sudo -u "riabininos" git config --global user.email "riabininos@gmail.com"

git config --system core.editor hx
sudo -u "riabininos" git config --global core.editor hx

# helix setup
mkdir -p /home/riabininos/.config/helix/
touch /home/riabininos/.config/helix/config.toml
chmod 775 /home/riabininos/.config/helix/config.toml
touch /home/riabininos/.config/helix/languages.toml
chmod 775 /home/riabininos/.config/helix/languages.toml

chown -R riabininos /home/riabininos/.config/helix/

cat <<EOF >/home/riabininos/.config/helix/config.toml
theme = "starlight"

[editor]
cursorline = true
color-modes = true

[editor.cursor-shape]
insert = "block"
normal = "underline"
select = "bar"

[editor.indent-guides]
render = true

[editor.whitespace.render]
space = "none"
tab = "all"
newline = "none"

[editor.soft-wrap]
enable = false

EOF

cat <<EOF >/home/riabininos/.config/helix/languages.toml
[[language]]
name = "bash"
file-types = ["config", "sh", "bash", "zsh", ".bash_login", ".bash_logout", ".bash_profile", ".bashrc", ".profile"]

EOF

hx --grammar fetch
hx --grammar build

sudo -u "riabininos" hx --grammar fetch
sudo -u "riabininos" hx --grammar build

# powerline adding

echo <<EOF > /home/riabininos/.bashrc

# powerline adding to terminal
if p -f /usr/share/powerline/bindings/bash/powerline.sh ]; then
  powerline-daemon -q
  POWERLINE_BASH_CONTINUATION=1
  POWERLINE_BASH_SELECT=1
  source /usr/share/powerline/bindings/bash/powerline.sh
fi

EOF
