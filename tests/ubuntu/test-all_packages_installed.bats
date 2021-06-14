# /usr/bin/env bats

@test "git should be successfully installed with apt" {
  run git --version
  [ "$?" -eq 0 ]
  dpkg --get-selections | grep git
  [ "$?" -eq 0 ]
}

@test "tmux should be successfully installed with apt" {
  run tmux --version
  [ "$?" -eq 0 ]
  dpkg --get-selections | grep tmux
  [ "$?" -eq 0 ]
}

@test "ghq should be successfully installed" {
  run ghq --version
  [ "$?" -eq 0 ]
}

@test "zsh should be successfully installed with apt" {
  run zsh --version
  [ "$?" -eq 0 ]
  dpkg --get-selections | grep zsh
  [ "$?" -eq 0 ]
}

@test "curl should be successfully installed with apt" {
  run curl --version
  [ "$?" -eq 0 ]
  dpkg --get-selections | grep curl
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

@test "direnv should be successfully installed with apt" {
  run direnv --version
  [ "$?" -eq 0 ]
  dpkg --get-selections | grep direnv
  [ "$?" -eq 0 ]
}

@test "neovim should be successfully installed with apt" {
  run nvim --version
  [ "$?" -eq 0 ]
  dpkg --get-selections | grep neovim
  [ "$?" -eq 0 ]
}

@test "powerline should be successfully installed" {
  run powerline-shell
  [ "$?" -eq 0 ]
}

@test "fd should be successfully installed" {
  run fd --version
  [ "$?" -eq 0 ]
}
