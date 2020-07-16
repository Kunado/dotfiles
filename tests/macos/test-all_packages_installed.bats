# /usr/bin/env bats

@test "git should be successfully installed with brew" {
  run git --version
  [ "$?" -eq 0 ]
  brew list | grep git
  [ "$?" -eq 0 ]
}

@test "tmux should be successfully installed with brew" {
  run tmux --version
  [ "$?" -eq 0 ]
  brew list | grep tmux
  [ "$?" -eq 0 ]
}

@test "ghq should be successfully installed with brew" {
  run ghq --version
  [ "$?" -eq 0 ]
  brew list | grep ghq
  [ "$?" -eq 0 ]
}

@test "zsh should be successfully installed with brew" {
  run zsh --version
  [ "$?" -eq 0 ]
  brew list | grep zsh
  [ "$?" -eq 0 ]
}

@test "curl should be successfully installed with brew" {
  run curl --version
  [ "$?" -eq 0 ]
  brew list | grep curl
  [ "$?" -eq 0 ]
}

@test "asdf should be successfully installed with brew" {
  run asdf --version
  [ "$?" -eq 0 ]
  brew list | grep asdf
  [ "$?" -eq 0 ]
}
