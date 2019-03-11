# environmental variables
# -------------------

## language settings
## ----------

export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

## vim, vimpager
## ----------

export VIM=/usr/local/bin/vim
export VIMPAGER=/usr/local/bin/vimpager

## editor and pager
## ----------

export EDITOR=$VIM
export PAGER=$VIMPAGER
export MANPAGER=$VIMPAGER

## PATH
## ----------

export GOPATH=$HOME/dev
export PATH=$GOPATH/bin:$PATH
export PATH=/usr/local/opt/ruby/bin:$PATH

# aliases
# -------------------

alias ls="ls -G"
alias l="ls -la"
alias la="ls -la"
alias l1="ls -1"
alias chrome="open -g -a /Applications/Google\ Chrome.app"
alias dc="docker-compose"
alias latexmk="latexmk -pvc"
alias delb="git branch | peco | xargs git branch -D"
alias chb="git branch | peco | xargs git checkout"
alias cdrepo='cd $(ghq root)/$(ghq list | peco)'
alias openrepo='hub browse $(ghq list | peco | cut -d "/" -f 2,3)'
alias ghqroot='cd $(ghq root)'
alias tree="tree -NC"
alias date="gdate"


# zsh settings
# -------------------

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


# prompt settings
# -------------------

autoload -U promptinit; promptinit
autoload -Uz colors; colors
autoload -Uz vcs_info
autoload -Uz is-at-least

# powerline
# -------------------

function powerline_precmd() {
    PS1="$(powerline-shell --shell zsh $?)"
}

function install_powerline_precmd() {
  for s in "${precmd_functions[@]}"; do
    if [ "$s" = "powerline_precmd" ]; then
      return
    fi
  done
  precmd_functions+=(powerline_precmd)
}

if [ "$TERM" != "linux" ]; then
    install_powerline_precmd
fi

# begin VCS
zstyle ":vcs_info:*" enable git svn hg bzr
zstyle ":vcs_info:*" formats "(%s)-[%b]"
zstyle ":vcs_info:*" actionformats "(%s)-[%b|%a]"
zstyle ":vcs_info:(svn|bzr):*" branchformat "%b:r%r"
zstyle ":vcs_info:bzr:*" use-simple true

zstyle ":vcs_info:*" max-exports 6

if is-at-least 4.3.10; then
    zstyle ":vcs_info:git:*" check-for-changes true # commitしていないのをチェック
    zstyle ":vcs_info:git:*" stagedstr "<S>"
    zstyle ":vcs_info:git:*" unstagedstr "<U>"
    zstyle ":vcs_info:git:*" formats "(%b) %c%u"
    zstyle ":vcs_info:git:*" actionformats "(%s)-[%b|%a] %c%u"
fi

function vcs_prompt_info() {
    LANG=en_US.UTF-8 vcs_info
    [[ -n "$vcs_info_msg_0_" ]] && echo -n " %{$fg[yellow]%}$vcs_info_msg_0_%f"
}
# end VCS
precmd(){
# insert blank line
  print
}

OK="PASS "
NG="ERROR "

PROMPT=""
PROMPT+="%(?.%F{green}$OK%f.%F{red}$NG%f) "
PROMPT+="%F{blue}%~%f"
PROMPT+="\$(vcs_prompt_info)"
PROMPT+="
"
PROMPT+="%% "

RPROMPT="[%*]"

#PROMPT="%{${fg[green]}%}[%n@%m]%{${reset_color}%} %~
#%# "


# 重複する要素を自動的に削除
typeset -U path cdpath fpath manpath

path=(
 #   $HOME/bin(N-/)
 #   /usr/local/bin(N-/)
 #   /usr/local/sbin(N-/)
    $path
    )

# -------------------------------------
# キーバインド
# -------------------------------------

bindkey -e

function cdup() {
   echo
   cd ..
   zle reset-prompt
}
zle -N cdup
bindkey '^K' cdup

bindkey "^R" history-incremental-search-backward

# -------------------------------------
# その他
# -------------------------------------

# cdしたあとで、自動的に ls する

# runnning ls after changing directory
function chpwd() { ls -1 }


# 'no matches found'
setopt nonomatch

# direnv
eval "$(direnv hook zsh)"

# added by travis gem
[ -f /Users/sarutanaoki/.travis/travis.sh ] && source /Users/sarutanaoki/.travis/travis.sh
