# My zsh config file.

# miniplug
## Init
source "$HOME/.local/share/miniplug.zsh" 
## Plugins
miniplug plugin 'git://github.com/zsh-users/zsh-autosuggestions'
miniplug plugin 'git://github.com/b4b4r07/zsh-vimode-visual'
miniplug plugin 'git://github.com/jeffreytse/zsh-vi-mode'
miniplug plugin 'git://github.com/zsh-users/zsh-syntax-highlighting'
miniplug plugin 'git://github.com/lukechilds/zsh-nvm'
## Load
miniplug load

# Completion
zstyle :compinstall filename '/home/tct/.zshrc'
autoload -Uz compinit
## Enable the menu when tab completing
compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
## Include dotfiles
_comp_options+=(globdots)
## History on up and down
autoload -Uz up-line-or-beginning-search
autoload -Uz down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search
bindkey "^[[B" down-line-or-beginning-search

# History
HISTFILE=~/.histfile
HISTSIZE=9999
SAVEHIST=9999
# Options
setopt autocd extendedglob nomatch

# UI
## Colors
autoload -U colors && colors

# Aliases
## QoL
alias n="$EDITOR"
alias c="clear"
alias xcc="xclip -selection clipboard"
alias xco="xclip -selection clipboard -o"
## Alternate programs
alias ls="exa --icons --group-directories-first -ah"
alias cat="bat --theme ansi"
alias lf='cd $(lfcd)'
## Package Management
alias install="apt-fast install -y"
alias uninstall="apt-fast remove -y"
alias update="apt-fast update -y"
## Utilities
alias firefresh="mkdir -p /tmp/temp_profile; firefox --profile /tmp/temp_profile; rm -rf /tmp/temp_profile"

# Some key caveats
## Home and End
### Insert mode
bindkey '^[[H' beginning-of-line
bindkey '^[[F' end-of-line
### Normal mode
bindkey -a '^[[H' vi-beginning-of-line
bindkey -a '^[[F' vi-end-of-line
## End
bindkey '^[[3~' delete-char
bindkey -a '^[[3~' delete-char

# Rice
echo "
 _____           _         ____             _      _         
|  ___|   _  ___| | __    / ___|  ___   ___(_) ___| |_ _   _ 
| |_ | | | |/ __| |/ /    \\___ \\ / _ \\ / __| |/ _ \\ __| | | |
|  _|| |_| | (__|   <      ___) | (_) | (__| |  __/ |_| |_| |
|_|   \\__,_|\\___|_|\\_\\    |____/ \\___/ \\___|_|\\___|\\__|\\__, |
                                                       |___/ 
"

# Prompt
autoload -U promptinit
promptinit
prompt pure

