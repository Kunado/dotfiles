# -------------------------------------
# 環境変数
# -------------------------------------

# SSHで接続した先で日本語が使えるようにする
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# エディタ
export EDITOR=/usr/local/bin/vim

# ページャ
export PAGER=/usr/local/bin/vimpager
export MANPAGER=/usr/local/bin/vimpager

# nodebrew
export PATH=$HOME/.nodebrew/current/bin:$PATH

# opencv
export PKG_CONFIG_PATH=/usr/local/Cellar/opencv/3.4.3_1/lib/pkgconfig:$PKG_CONFIG_PATH
export LD_LIBRARY_PATH=/usr/local/Cellar/opencv/3.4.3_1/lib:$LD_LIBRARY_PATH

# elasticsearch
export ELASTICPATH=/usr/local/opt/elasticsearch/libexec/bin
export PATH=$PATH:$ELASTICPATH

# rbenv
eval "$(rbenv init -)"

export RAILS_ENV=development

export PATH=$PATH:/
# -------------------------------------
# zshのオプション
# -------------------------------------

## 補完機能の強化
autoload -U compinit
compinit

## 入力しているコマンド名が間違っている場合にもしかして：を出す。
setopt correct

# ビープを鳴らさない
setopt nobeep

## 色を使う
setopt prompt_subst

## ^Dでログアウトしない。
setopt ignoreeof

## バックグラウンドジョブが終了したらすぐに知らせる。
setopt no_tify

## 直前と同じコマンドをヒストリに追加しない
setopt hist_ignore_dups

# 補完
## タブによるファイルの順番切り替えをしない
unsetopt auto_menu

# cd -[tab]で過去のディレクトリにひとっ飛びできるようにする
setopt auto_pushd

# ディレクトリ名を入力するだけでcdできるようにする
setopt auto_cd

# -------------------------------------
# パス


# 重複する要素を自動的に削除
typeset -U path cdpath fpath manpath

#path=(
#    $HOME/bin(N-/)
#    /usr/local/bin(N-/)
#    /usr/local/sbin(N-/)
#    $path
#)

# -------------------------------------
# プロンプト
# -------------------------------------

autoload -U promptinit; promptinit
autoload -Uz colors; colors
autoload -Uz vcs_info
autoload -Uz is-at-least

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

# -------------------------------------
# エイリアス
# -------------------------------------

# -n 行数表示, -I バイナリファイル無視, svn関係のファイルを無視
alias grep="grep --color -n -I --exclude='*.svn-*' --exclude='entries' --exclude='*/cache/*'"

# ls
alias ls="ls -G" # color for darwin
alias l="ls -la"
alias la="ls -la"
alias l1="ls -1"
alias subl='reattach-to-user-namespace subl'

# tree
alias tree="tree -NC" # N: 文字化け対策, C:色をつける

# applications
alias brackets="open -g -a /Applications/Brackets.app"
alias chrome="open -g -a /Applications/Google\ Chrome.app"
alias emacs='/Applications/Emacs.app/Contents/MacOS/Emacs'
alias subl='open -g -a /Applications/Sublime\ Text.app'

# related to docker
alias dc='docker-compose'
alias dc run='docker-compose run --rm'
alias be='bundle exec'

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
function chpwd() { ls -1 }

# iTerm2のタブ名を変更する
function title {
    echo -ne "\033]0;"$*"\007"
}

# -------------------------------------
# aliases
# -------------------------------------

alias lsusb="system_profiler SPUSBDataType"

# 'no matches found'
setopt nonomatch

# direnv
eval "$(direnv hook zsh)"

# added by travis gem
[ -f /Users/sarutanaoki/.travis/travis.sh ] && source /Users/sarutanaoki/.travis/travis.sh


source ~/.bashrc
powerline-daemon -q
. /usr/local/lib/python2.7/site-packages/powerline/bindings/zsh/powerline.zsh
export UID=501
alias latexmk="latexmk -pvc"
export GOPATH=/Users/sarutanaoki/dev
export PATH=/Users/sarutanaoki/.nodebrew/current/bin:/Users/sarutanaoki/.rbenv/shims:/Users/sarutanaoki/.nodebrew/current/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Library/TeX/texbin:/usr/local/opt/elasticsearch/libexec/bin:/:GOPATH/bin:/Users/sarutanaoki/dev/bin
alias delb='git branch | peco | xargs git branch -D'