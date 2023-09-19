### Load bashrc ###
[[ -f ~/.bashrc ]] && . ~/.bashrc

### Add directories to path if they exist ###
[[ -d $HOME/bin ]] && PATH=$HOME/bin:$PATH
[[ -d $HOME/.local/bin ]] && PATH=$HOME/.local/bin:$PATH
[[ -d $HOME/.local/scripts ]] && PATH=$HOME/.local/scripts:$PATH
