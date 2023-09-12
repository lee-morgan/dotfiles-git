### This is my .bashrc file that has been butchered from several youtube creators

### If not running interactively don't do anything.
[[ $- != *i* ]] && return

# Custom aliases
[[ -f $HOME/.config/bash/aliases ]] && . $HOME/.config/bash//aliases

# Terminal theming
[[ -f $HOME.config/bash/style ]] && . $HOME/.config/bash/style

# Custom functions
[[ -f $HOME/.config/bash/functions ]] && . $HOME/.config/bash/functions

### Export useful environment variables
[[ -f $HOME/.config/bash/exports ]] && . $HOME/.config/bash/exports

### Export useful environment variables
[[ -f $HOME/.config/bash/options ]] && . $HOME/.config/bash/options

### Show system information at login
if type -p "neofetch" > /dev/null; then
  neofetch
fi

# Use starship prompt if it's installed
if command -v starship >/dev/null; then
  eval "$(starship init bash)"
else
  export PS1="\[\033[38;5;2m\]┌────(\[\033[38;5;38m\]\u\[\033[38;5;2m\]::\[\033[38;5;38m\]\h\[\033[38;5;2m\])─[\[$(tput sgr0)\]\[\033[38;5;38m\]\w\[$(tput sgr0)\]\[\033[38;5;2m\]]\n└─(\j)\\$ \[$(tput sgr0)\]"
fi
