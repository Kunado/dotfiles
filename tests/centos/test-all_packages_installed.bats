# /usr/bin/env bats

@test "git should be successfully installed with dnf" {
  run git --version
  [ "$?" -eq 0 ]
  dnf list --installed git
  [ "$?" -eq 0 ]
}

@test "tmux should be successfully installed with dnf" {
  run tmux --version
  [ "$?" -eq 0 ]
  dnf list --installed tmux
  [ "$?" -eq 0 ]
}

@test "ghq should be successfully installed" {
  run ghq --version
  [ "$?" -eq 0 ]
}

@test "zsh should be successfully installed with dnf" {
  run zsh --version
  [ "$?" -eq 0 ]
  dnf list --installed zsh
  [ "$?" -eq 0 ]
}

@test "curl should be successfully installed with dnf" {
  run curl --version
  [ "$?" -eq 0 ]
  dnf list --installed curl
  [ "$?" -eq 0 ]
}

@test "zplug should be successfully installed" {
  run zplug
  [ "$?" -eq 0 ]
}

@test "asdf should be successfully installed" {
  run asdf --version
  [ "$?" -eq 0 ]
}

@test "fzf should be successfully installed" {
  run fzf --version
  [ "$?" -eq 0 ]
}

@test "direnv should be successfully installed" {
  run direnv --version
  [ "$?" -eq 0 ]
}

@test "neovim should be successfully installed" {
  run nvim --version
  [ "$?" -eq 0 ]
}
