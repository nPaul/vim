#!/bin/bash

echo Installing

install_dir=$HOME/.local

cd /tmp
git clone --branch v8.2.5172  https://github.com/vim/vim.git
cd /tmp/vim/src/

make clean distclean
./configure \
    --enable-python3interp \
    --enable-rubyinterp \
    --enable-luainterp \
    --prefix=$install_dir

make -j4
make install

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

ln -sfn $HOME/.config/nvim/init.vim $HOME/.vimrc
ln -sfn $install_dir/bin/vim $HOME/bin/vim
