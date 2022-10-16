#!/bin/bash

echo Installing NeoVim

install_dir=$HOME/.local/bin

if [[ ! -e $install_dir ]]; then
    mkdir -p $install_dir
fi
 
curl -fLo $install_dir/nvim.appimage https://github.com/neovim/neovim/releases/download/v0.7.0/nvim.appimage
chmod +x $install_dir/nvim.appimage

sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
           https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

ln -sfn $install_dir/nvim.appimage $HOME/bin/nvim
ln -sfn $(pwd)/vimrc $HOME/.config/nvim/init.vim

