### Check we're interactive ###
[[ $- != *i* ]] && return

### Aliases ###
[[ -f $HOME/.config/bash/aliases ]] && . $HOME/.config/bash//aliases

### Styling ###
[[ -f $HOME/.config/bash/style ]] && . $HOME/.config/bash/style

### Functions ###
[[ -f $HOME/.config/bash/functions ]] && . $HOME/.config/bash/functions

### Export Variables ###
[[ -f $HOME/.config/bash/exports ]] && . $HOME/.config/bash/exports

### Shopt Options ###
[[ -f $HOME/.config/bash/options ]] && . $HOME/.config/bash/options

### Show system information at login ###
if type -p "neofetch" > /dev/null; then
  # I only want to run for the first opened terminal
  [[ ! -f /tmp/runonce ]] && neofetch && touch /tmp/runonce
fi

### Use starship prompt if it's installed ###
if command -v starship >/dev/null; then
  eval "$(starship init bash)"
else
  export PS1="\[\033[38;5;2m\]┌────(\[\033[38;5;38m\]\u\[\033[38;5;2m\]::\[\033[38;5;38m\]\h\[\033[38;5;2m\])─[\[$(tput sgr0)\]\[\033[38;5;38m\]\w\[$(tput sgr0)\]\[\033[38;5;2m\]]\n└─(\j)\\$ \[$(tput sgr0)\]"
fi
