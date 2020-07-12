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
