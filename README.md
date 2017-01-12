# tmux+vim
this setup works only on debian linux  and cygwin for now

For cygwin installation to work you should have wget package installed with cygwin

To use the setup:
  -  `./install <Options> [cygwin|debian]` (e.g. `./install -s zsh debian` )
  
Usage :
  - `^a` (CTRL+a) is the new prefix instead of `^b` 
  - `tmux new -s <session_name>` - creates new session
  -  Hit `^a + I` to fetch the plugins and source them. You should now be able to use the plugins.
  - `tma <session_name>` - attach to session
  - `tmk <session_name>` - kill session

Hints :
  - Go through `~/.tmux.conf` and review the changed binds
  - Sometimes Yank plugin for copying to clipboard breaks the UI. Use `^a + r` to fix it fast
  
## Enjoy :smirk: :
![alt tag](https://raw.githubusercontent.com/adrian-galbenus/tmux-vim/develop/tmux%2Bvim.png)
