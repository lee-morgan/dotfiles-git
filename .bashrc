### This is my .bashrc file that has been butchered from several youtube creators

### Load supporting configurations

# Custom aliases
[[ -f $HOME/.config/bash/aliases ]] && . $HOME/.config/bash//aliases

# Terminal theming
[[ -f $HOME.config/bash/style ]] && . $HOME/.config/bash/style

# Custom functions
[[ -f $HOME/.config/bash/functions ]] && . $HOME/.config/bash/functions

### Export useful environment variables
[[ -f $CFG/exports ]] && . $CFG/exports

export TERM=linux
export EDITOR="vim"
export ALTERNATE_EDITOR="nano" 
export VISUAL="code"
export HISTSIZE=1000
export HISTFILESIZE=2000
export HISTCONTROL=ignoredups:erasedups
export HISTTIMEFORMAT="%Y-%m-%d %T "

### Show system information at login
if type -p "neofetch" > /dev/null; then
  neofetch
fi

### If not running interactively don't do anything.
[[ $- != *i* ]] && return

### Set shopt options
shopt -s autocd # change to named directory
shopt -s cdspell # autocorrects cd misspellings
shopt -s cmdhist # save multi-line commands in history as single line
shopt -s dotglob
shopt -s histappend # do not overwrite history
shopt -s expand_aliases # expand aliases
shopt -s checkwinsize # checks term size when bash regains control

### ignore upper and lowercase when TAB completion
bind "set completion-ignore-case on"

# Enable programmable completion features
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

### Change the title of terminals
case ${TERM} in
  xterm*|rxvt*|Eterm*|aterm|kterm|gnome*|alacritty|st|konsole*)
    PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/\~}\007"'
        ;;
  screen*)
    PROMPT_COMMAND='echo -ne "\033_${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/\~}\033\\"'
    ;;
esac

# Use starship prompt if it's installed
if command -v starship >/dev/null; then
  eval "$(starship init bash)"
else
  export PS1="\[\033[38;5;2m\]┌────(\[\033[38;5;38m\]\u\[\033[38;5;2m\]::\[\033[38;5;38m\]\h\[\033[38;5;2m\])─[\[$(tput sgr0)\]\[\033[38;5;38m\]\w\[$(tput sgr0)\]\[\033[38;5;2m\]]\n└─(\j)\\$ \[$(tput sgr0)\]"
fi
