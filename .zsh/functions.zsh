# functions
# -------------------

## shell
## ----------

# insert blank line
precmd(){
  print
}

# runnning ls after changing directory
function chpwd() {
	ls -1
}

# setting environmental variables
function setenvvars() {
  local envfile=$1
  while read line
  do
    local KEY=$(echo $line | awk -F'[=]' '{print $1}')
    local VAL=$(echo $line | awk -F'[=]' '{print $2}')
    export $KEY=$VAL
  done < $envfile
}

function local-sample() {
  local file=$1
  awk -F'=' '{printf "%s=",$1}' $file > $file.sample
}

## history
## ----------

function fzf-select-history() {
  BUFFER="$(history -nr 1 | awk '!a[$0]++' | fzf | sed 's/\\n/\n/')"
  CURSOR=$#BUFFER
  zle -R -c
}
zle -N fzf-select-history
bindkey '^H' fzf-select-history


## powerline
## ----------

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


## ghq
## ----------

function ghq-new() {
  local root=`ghq root`
  local user=`git config --get github.user`
  if [ -z "$user" ]; then
    echo "you need to set github.user."
    echo "git config --global github.user YOUR_GITHUB_USER_NAME"
    return 1
  fi
  local name=$1
  local repo="$root/github.com/$user/$name"
  if [ -e "$repo" ]; then
    echo "$repo is already exists."
    return 1
  fi
  git init $repo
  cd $repo
  echo "# ${(C)name}" > README.md
  git add .
}

## git
## ----------

function gadd() {
  local selected
  selected=$(unbuffer git status -s | fzf -m --ansi --preview="echo {} | awk '{print \$2}' | xargs git diff --color" | awk '{print $2}')
  if [[ -n "$selected" ]]; then
    selected=$(tr '\n' ' ' <<< "$selected")
    git add ${selected}
    echo "git add ${selected}"
  fi
}

function fshow() {
  local out shas sha q k
  while out=$(
    git log --graph --color=always \
            --format="%C(auto)%h%d %s %C(black)%C(bold)%cr" "$@" |
    fzf --ansi --multi --no-sort --reverse --query="$q" \
        --print-query --expect=ctrl-d); do
    q=$(head -1 <<< "$out")
    k=$(head -2 <<< "$out" | tail -1)
    shas=$(sed '1,2d;s/^[^a-z0-9]*//;/^$/d' <<< "$out" | awk '{print $1}')
    [ -z "$shas" ] && continue
    if [ "$k" = ctrl-d ]; then
      git diff --color=always $shas | less -R
    else
      for sha in $shas; do
        git show --color=always $sha | less -R
      done
    fi
  done
}

function push-branch() {
  local branch_name=$(git branch | grep '*' | awk '{print $2}')
  git push --set-upstream origin $branch_name
}


## github
## ----------

function pr() {
  local parentBranch=$(git branch | fzf)
  local currentBranch=$(git branch | grep "*")
  local repoURL=$(git remote -v | awk '{print $2}' | sed -n 1p | sed s#.*github.com.#https://github.com/#g | sed s\/\.git$//g)
  chrome ${repoURL/* /}/compare/${parentBranch/* /}...${currentBranch/* /}
}

function gfpc (){
  local current_branch_name=$(git symbolic-ref --short HEAD|tr -d \"\\n\")
  echo "$@" | sed -E 's/^dev//' | {
    read num
    case "$num" in
      "2" ) num="2nd" ;;
      "3" ) num="3rd" ;;
      [3-9]* ) num=$num"th" ;;
      * ) num="error" ;;
    esac
    if [ $num == "error" ] ; then
      echo "branch not found."
      return 1
    fi
    local deploy_branch_name="deployment/development_"$num
    echo $deploy_branch_name

    git push -f origin $current_branch_name:$deploy_branch_name
  }
}

function feat-br() {
  git checkout -b feature/$1
}

function create-pr() {
  local currentBranch=$(git symbolic-ref --short HEAD)
  git empty-commit
  git push --set-upstream origin $currentBranch
  export PR_NUM=$(hub pull-request --no-edit | awk -F'[/]' '{print $NF}')
  git reset HEAD^
}

function feat-commit() {
  git commit -m "GH-$PR_NUM $1"
}

## grep
## ----------

function grepr() {
  local string=$1
  local dir=$2
  grep -r "$string" $dir
}

function greprsoniq() {
  local string=$1
  local dir=$2
  grepr $string $dir | awk -F[:] '{print $1}' | soniq
}

## mas
## ----------

function mas-search-id() {
  mas search $1 | fzf | awk '{print $1}'
}

## compile and locate bin file to $PATH
## ----------

function gccbin() {
  local fileName=$1
  local binName=$(echo $fileName | awk -F'[.]' '{print $1}')
  gcc -o $GOPATH/bin/c/$binName $fileName
}

## ghq
## ----------

function cdrepo() {
  local targetRepo=$(ghq list --full-path | fzf --preview="ls {}")
  if [[ -z "$targetRepo" ]]; then
    return 1
  fi
  cd $targetRepo
}
zle -N cdrepo
bindkey '^z' cdrepo

## awk
## -----------

function awki() {
  local num=$1
  awk "{print \$${num}}"
}

function _get_hosts() {
  local hosts=$(cut -d' ' -f1  ~/.ssh/known_hosts | tr -d '[]' | tr ',' '\n' | cut -d: -f1)
  echo $hosts
}

function fzf-ssh() {
  hosts=`_get_hosts`
  local selected_host=$(echo $hosts | peco --prompt="ssh >" --query "$LBUFFER")
  if [ -n "$selected_host" ]; then
      BUFFER="ssh ${selected_host}"
      zle accept-line
  fi
}
zle -N fzf-ssh
bindkey '^x' fzf-ssh

## memorandums
## ----------

function memo-new() {
  local title=$1
  local dir=$(date "+%Y-%m-%d")
  if [ ! -d ~/memorandums/${dir} ]; then
    mkdir ~/memorandums/${dir}
  fi
  if [ ! -n ${title} ]; then
    exit 1
  fi
  nvim ~/memorandums/${dir}/${title}.md
}

function memos() {
  ls ~/memorandums | fzf --preview="ls ~/memorandums/{}"
}

function memo-edit() {
  local date=~/memorandums/${1}
  ls ${date}
}

## bookmarks
## ----------

function bm() {
  local target=$1
  local name=$2
  if [ $# -eq 1 ]; then
    local path_tail=$(echo $target | awk -F'/' '{print $NF}')
    ln -s $target $HOME/bookmarks/$path_tail
  elif [ $# -eq 2 ]; then
    ln -s $target $HOME/bookmarks/$name
  fi
}

function cdbm() {
  cd $HOME/bookmarks/$1
}

function _cdbm() {
  _files -W $HOME/bookmarks/ && return 0;
  return 1;
}

compdef _cdbm cdbm
