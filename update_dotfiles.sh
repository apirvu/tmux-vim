#!/usr/bin/env bash
if [ -f $(which curl) ];then
	curl https://raw.githubusercontent.com/adrian-galbenus/tmux-vim/develop/dotfiles/.tmux.conf > ~/.tmux.conf
	curl https://raw.githubusercontent.com/adrian-galbenus/tmux-vim/develop/dotfiles/.vimrc > ~/.vimrc
	curl https://raw.githubusercontent.com/adrian-galbenus/tmux-vim/develop/dotfiles/.zshrc > ~/.zshrc
else
	sudo apt-get -y install curl
	curl https://raw.githubusercontent.com/adrian-galbenus/tmux-vim/develop/dotfiles/.tmux.conf > ~/.tmux.conf
	curl https://raw.githubusercontent.com/adrian-galbenus/tmux-vim/develop/dotfiles/.vimrc > ~/.vimrc
	curl https://raw.githubusercontent.com/adrian-galbenus/tmux-vim/develop/dotfiles/.zshrc > ~/.zshrc
fi	
