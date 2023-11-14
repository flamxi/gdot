#!/bin/bash
clear

# Set installation mode
mode="live"
DOTFILES_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

if [ ! -z $1 ]; then
    mode="dev"
    echo "IMPORTANT: DEV MODE ACTIVATED. "
    echo "Existing dotfiles folder will not be modified."
    echo "Symbolic links will not be created."
fi

cat <<"EOF"
     _       _    __ _ _
  __| | ___ | |_ / _(_) | ___  ___
 / _` |/ _ \| __| |_| | |/ _ \/ __|
| (_| | (_) | |_|  _| | |  __/\__ \
 \__,_|\___/ \__|_| |_|_|\___||___/

EOF
version="1.0"
echo "Version: $version"
echo "by Spade 2023"
echo ""
echo "This script will guide you through the installation process of my dotfiles."
echo ""
source scripts/library.sh
source scripts/confirm-start.sh
# source scripts/backup.sh
source scripts/qtile.sh
source scripts/qtile-packages.sh
# source scripts/install-packages.sh
# source scripts/pywal.sh
source scripts/wallpaper.sh
source scripts/config-folder.sh
# source scripts/init-pywal.sh
source scripts/qtile-dotfiles.sh
# source scripts/bashrc.sh
source scripts/install-zsh.sh

echo ""

source scripts/done.sh
