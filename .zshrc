# zsh settings
# -------------------

## load environmental variables, aliases and functions
## ----------

[ -f ~/.zshrc.local ] && source ~/.zshrc.local
[ -f ~/.zshrc_functions ] && source ~/.zshrc_functions
[ -f ~/.zshrc_envvars ] && source ~/.zshrc_envvars
[ -f ~/.zshrc_aliases ] && source ~/.zshrc_aliases
[ -f ~/.zshrc_local ] && source ~/.zshrc_local
[ -f ~/.zshrc_zplug ] && source ~/.zshrc_zplug
## auto completion
## ----------

autoload -U compinit
compinit
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

bindkey -e
bindkey "^R" history-incremental-search-backward


# other settings
# -------------------

# direnv
eval "$(direnv hook zsh)"

# anyenv
eval "$(anyenv init - zsh)"

# added by travis gem
[ -f ~/.travis/travis.sh ] && source ~/.travis/travis.sh
