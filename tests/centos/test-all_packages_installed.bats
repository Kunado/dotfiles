# /usr/bin/env bats

@test "git should be successfully installed with apt" {
  run git --version
  [ "$?" -eq 0 ]
  dnf list --installed git
  [ "$?" -eq 0 ]
}

@test "tmux should be successfully installed with apt" {
  run tmux --version
  [ "$?" -eq 0 ]
  dnf list --installed tmux
  [ "$?" -eq 0 ]
}

@test "ghq should be successfully installed" {
  run ghq --version
  [ "$?" -eq 0 ]
}

@test "zsh should be successfully installed with apt" {
  run zsh --version
  [ "$?" -eq 0 ]
  dnf list --installed zsh
  [ "$?" -eq 0 ]
}

@test "curl should be successfully installed with apt" {
  run curl --version
  [ "$?" -eq 0 ]
  dnf list --installed curl
  [ "$?" -eq 0 ]
}

@test "zplug should be successfully installed" {
  run zplug
  [ "$?" -eq 0 ]
}

#@test "asdf should be successfully installed with apt" {
#  run asdf --version
#  [ "$?" -eq 0 ]
#  dnf list --installed asdf
#  [ "$?" -eq 0 ]
#}
