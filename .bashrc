# This is my .bashrc file that has been butchered from several youtube creators

# Load aliases file
#source ~/.aliases

# Load bash functions
#source ~/.bash_functions

[[ -f ~/.aliases ]] && . ~/.aliases
[[ -f ~/.bash_styles ]] && . ~/.bash_styles
[[ -f ~/.bash_functions ]] && . ~/.bash_functions

### Export useful environment variables
export TERM=linux
export EDITOR="vim"
export ALTERNATE_EDITOR="nano" 
export VISUAL="code"
export HISTSIZE=1000
export HISTFILESIZE=2000
export HISTCONTROL=ignoredups:erasedups
export HISTTIMEFORMAT="%Y-%m-%d %T "

### Show system information at login
if [ -t 0 ]; then
    if type -p "neofetch" > /dev/null; then
        neofetch
    else
        echo "DOH!!! neofetch is not installed.\nInstall with sudo apt install neofetch"
    fi
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

### Add /home/$USER/bin to $PATH
case :$PATH: in
	*:/home/$USER/bin:*) ;;
	*) PATH=/home/$USER/bin:$PATH ;;
esac

### Add /home/$USER/.local/bin to $PATH
case :$PATH: in
	*:/home/$USER/.local/bin:*) ;;
	*) PATH=/home/$USER/.local/bin:$PATH ;;
esac

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

### Comment out if using sharship prompt (below)
#export PS1="\[\033[38;5;2m\]┌────(\[\033[38;5;38m\]\u\[\033[38;5;2m\]::\[\033[38;5;38m\]\h\[\033[38;5;2m\])─[\[$(tput sgr0)\]\[\033[38;5;38m\]\w\[$(tput sgr0)\]\[\033[38;5;2m\]]\n└─(\j)\\$ \[$(tput sgr0)\]"

### Set the starship prompt
eval "$(starship init bash)"
