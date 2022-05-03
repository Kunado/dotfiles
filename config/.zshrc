# zsh settings
# -------------------


## auto completion
## ----------

autoload -Uz compinit
compinit


## settings for each environment
## ----------

[ -f ~/.zshrc.local ] && source ~/.zshrc.local
[ -f ~/.zshrc.darwin ] && source ~/.zshrc.darwin
[ -f ~/.zshrc.ubuntu ] && source ~/.zshrc.ubuntu
[ -f ~/.zshrc.redhat ] && source ~/.zshrc.redhat


## load environmental variables, aliases and functions
## ----------

[ -f ~/.zsh/aliases.zsh ] && source ~/.zsh/aliases.zsh
[ -f ~/.zsh/functions.zsh ] && source ~/.zsh/functions.zsh
[ -f ~/.zsh/envvars.zsh ] && source ~/.zsh/envvars.zsh
[ -f ~/.zsh/zplug.zsh ] && source ~/.zsh/zplug.zsh
[ -f ~/.zsh/tmux.zsh ] && source ~/.zsh/tmux.zsh


setopt correct


### return directories previously accessed with cd -[tab]
### -----

setopt auto_pushd

### enable changing directory without cd
### -----

setopt auto_cd

### disable switching options with [tab]
### -----

# unsetopt auto_menu

## cancel beeping
## ----------

setopt nobeep

## coloring
## ----------

setopt prompt_subst

## prevent logging out with Ctrl + D
## ----------

setopt ignoreeof

## notify after finishing background job
## ----------

setopt no_tify

## ignore duplication of command history
## ----------

setopt hist_ignore_dups

## nomatch
## ----------
setopt nonomatch


# prompt settings
# -------------------

autoload -U promptinit; promptinit
autoload -Uz colors; colors
autoload -Uz vcs_info
autoload -Uz is-at-least

# delete duplicated elements
typeset -U path cdpath fpath manpath

path=(
 #   $HOME/bin(N-/)
 #   /usr/local/bin(N-/)
 #   /usr/local/sbin(N-/)
    $path
    )


# keybind settings
# -------------------

bindkey -v
bindkey "^R" history-incremental-search-backward


# other settings
# -------------------

# direnv
eval "$(direnv hook zsh)"


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
