alias chrome='chromium-browser'
alias github='chromium-browser https://github.com'
alias c='clear &&'
alias tmux='tmux -2' 
alias tma='tmux a -t' 
alias tmk='tmux kill-session -t' 
export LANGUAGE=en_US.UTF-8
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
setxkbmap -layout us -option ctrl:nocaps


source ~/.antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git
antigen bundle heroku
antigen bundle pip
antigen bundle lein
antigen bundle command-not-found

# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting

# Load the theme.
#antigen theme https://gist.github.com/xfanwu/18fd7c24360c68bab884 xxf
antigen theme https://github.com/denysdovhan/spaceship-zsh-theme spaceship

# Tell antigen that you're done.
antigen apply
DISABLE_AUTO_TITLE="true"
