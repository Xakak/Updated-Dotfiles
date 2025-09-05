
# Enable colors and change prompt:
alias p="sudo pacman"
alias cp="cp -i"
alias rm-rf="rm -rfi"
alias mv="mv -i"
alias c="clear"
alias ld="eza -lhD --icons=auto" # long list dirs
alias lt="eza --icons=auto --tree" # list folder as tree
alias l="eza -lh --icons=auto" # long list
alias ls="eza -1 --icons=auto" # short list
alias ll="eza -lha --icons=auto --sort=name --group-directories-first"

# History in cache directory:
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=/home/rayan/.zsh_history

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.

# vi mode
bindkey -v
export KEYTIMEOUT=1

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

# Change cursor shape for different vi modes.
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'
  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[1 q'
  fi
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[1 q"
}
zle -N zle-line-init
echo -ne '\e[1 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[1 q' ;} # Use beam shape cursor for each new prompt.

# Use lf to switch directories and bind it to ctrl-o
lfcd () {
    tmp="$(mktemp)"
    lf -last-dir-path="$tmp" "$@"
    if [ -f "$tmp" ]; then
        dir="$(cat "$tmp")"
        rm -f "$tmp"
        [ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"
    fi
}


ZSH_THEME="robbyrussell"

# Edit line in vim with ctrl-e:
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

# Load aliases and shortcuts if existent.
[ -f "$HOME/.config/shortcutrc" ] && source "$HOME/.config/shortcutrc"
[ -f "$HOME/.config/aliasrc" ] && source "$HOME/.config/aliasrc"

# Load zsh-syntax-highlighting; should be last.


plugins=(git zsh-autosuggestions zsh-syntax-highlighting)
source /home/rayan/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

source /home/rayan/.oh-my-zsh/custom/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

source /home/rayan/.oh-my-zsh/custom/plugins/fzf-tab/fzf-tab.zsh
export ZSH="$HOME/.oh-my-zsh"
source $ZSH/oh-my-zsh.sh

# Created by `pipx` on 2025-02-03 12:52:38
export PATH="$PATH:/home/rayan/.local/bin"

source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh

alias ls="eza --icons=auto"
alias fzf-files="fzf --ansi --preview 'bat --color=always --style=numbers {}' | xargs -n 1 nvim"
alias ld="eza -lhD --icons=auto" # long list dirs
alias lt="eza --icons=auto --tree" # list folder as tree
alias l="eza -lh --icons=auto" # long list
alias ll="eza -lha --icons=auto --sort=name --group-directories-first"
alias vim="nvim"

export PATH=$PATH:/home/rayan/.spicetify
export PATH="$HOME/flutter/bin:$PATH"
export PATH=$PATH:/home/rayan/.spicetify
