#!/usr/bin/env bash

# Figure out directory this script resides in
exedir=$(readlink -f $(dirname $0))


if [[ $(which vim) ]]; then
    echo "Vim is already installed."
else
#    sudo apt-get -y update
#    sudo apt-get -y upgrade
    sudo apt-get -y install vim-gnome
fi

if [[ $(which tmux) ]]; then
    echo "Tmux is already installed."
else
    ./debian_tmux_from_source.sh
fi

#Install xsel and xclip for copy clipboard to work and other utils
if [[ $(which xclip) && $(which xsel) ]]; then
    echo "Both xclip and xsel are installed"
else
    sudo apt-get -y install xclip xsel
    sudo apt-get -y install ack-grep
    sudo apt-get -y install python-dev python3-dev
    sudo apt-get -y install build-essential cmake
    #yum install xclip xsel
fi


read -p "This step will install java 8 if you are using a lower version.
	Are you sure you want to do this? (Y/N) " -n 1 -r
echo    # (optional) move to a new line
if [[ ! $REPLY =~ ^[Yy]$ ]]
    then
	[[ "$0" = "$BASH_SOURCE" ]] && exit 1 || return 1
    else
	#Install java8 if not installed yet
	if [[ $( java -version 2>&1 | grep -i version | cut -d'"' -f2 | cut -d'.' -f1-2) < 1.8 ]]; then
	    sudo sh -c 'echo "deb http://ppa.launchpad.net/webupd8team/java/ubuntu xenial main" | tee /etc/apt/sources.list.d/webupd8team-java.list'
	    sudo sh -c 'echo "deb-src http://ppa.launchpad.net/webupd8team/java/ubuntu xenial main" | tee -a /etc/apt/sources.list.d/webupd8team-java.list'
	    sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys EEA14886
	    sudo apt-get update
	    sudo apt-get -y install oracle-java8-set-default
	fi

    fi

#Vim+TMUX dotfiles
cp -r ../dotfiles/{.vimrc,.tmux.conf} ~/
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/vundle
vim +PluginInstall
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

if grep -q "alias tmux=" ~/.bashrc ; then
    echo "tmux alias is allready set in ~/.bashrc"
else
    sed -i -e "1s|^|alias tmux='tmux -2' \nalias tma='tmux a -t' \nalias tmk='tmux kill-session -t' \nexport LC_ALL=C \n | " ~/.bashrc
fi

if [[ -f ~/.zshrc ]]
then 
	if grep -q "alias tmux=" ~/.zshrc ; then
		echo "tmux alias is allready set in ~/.zshrc"
	else
		sed -i -e "1s|^|alias tmux='tmux -2' \nalias tma='tmux a -t' \nalias tmk='tmux kill-session -t' \n | " ~/.zshrc
	fi

fi
