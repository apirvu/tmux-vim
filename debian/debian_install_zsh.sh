#!/bin/sh
# Build Zsh from sources on Ubuntu.
# From http://zsh.sourceforge.net/Arc/git.html and sources INSTALL file.

# Some packages may be missing
sudo apt-get install -y git-core gcc make autoconf yodl libncursesw5-dev texinfo

git clone git://zsh.git.sf.net/gitroot/zsh/zsh

cd zsh

./Util/preconfig

# Options from Ubuntu Zsh package rules file (http://launchpad.net/ubuntu/+source/zsh)
./configure --prefix=/usr \
            --mandir=/usr/share/man \
            --bindir=/bin \
            --infodir=/usr/share/info \
            --enable-maildir-support \
            --enable-max-jobtable-size=256 \
            --enable-etcdir=/etc/zsh \
            --enable-function-subdirs \
            --enable-site-fndir=/usr/local/share/zsh/site-functions \
            --enable-fndir=/usr/share/zsh/functions \
            --with-tcsetpgrp \
            --with-term-lib="ncursesw" \
            --enable-cap \
            --enable-pcre \
            --enable-readnullcmd=pager \
            --enable-custom-patchlevel=Debian \
            LDFLAGS="-Wl,--as-needed -g"

make

make check

sudo make install

sudo make install.info
cd ..
sleep 5 

if [ $(which curl) ]
then
    curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh
else
   sudo apt-get -y install curl
   curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh 
fi

command -v zsh | sudo tee -a /etc/shells
chsh -s $(which zsh) "${USER}" 

cp -rf  ../dotfiles/.zshrc ~/
rm -rf zsh 
#install spaceship theme for zsh
curl -o - https://raw.githubusercontent.com/denysdovhan/spaceship-zsh-theme/master/install.sh | zsh

