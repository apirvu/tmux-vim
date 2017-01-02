#!/usr/bin/env bash

# Figure out directory this script resides in
exedir=$(readlink -f $(dirname $0))

#Install sage package manager
wget -O sage https://raw.githubusercontent.com/svnpenn/sage/master/sage
install sage /bin

if [[ $(which vim) ]]; then
    echo "Vim is already installed."
else
	sage update
	sage install vim
fi

if [[ $(which tmux) ]]; then
    echo "Tmux is already installed."
else
	sage install tmux
    sage install cygutils-extra
fi

#Vim+TMUX dotfiles
cp -r ../dotfiles/{.vim,.vimrc,.tmux.conf,.tmux} ~/
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/vundle
vim +PluginInstall
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
#this line gives an error in cygwin
sed -i '/ status-utf8 /s/^/#/' ~/.tmux.conf
if grep -q "alias tmux=" ~/.bashrc ; then
    echo "tmux alias is allready set in ~/.bashrc"
else
    sed -i -e "1s|^|alias tmux='tmux -2' \n | " ~/.bashrc
fi
