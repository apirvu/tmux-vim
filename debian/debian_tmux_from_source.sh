sudo apt-get update
sudo apt-get upgrade
sudo apt-get install libevent-dev libncurses5-dev

wget https://github.com/tmux/tmux/releases/download/2.1/tmux-2.1.tar.gz
tar xfa tmux-2.1.tar.gz
cd tmux-2.1
./configure && make
sudo make install
