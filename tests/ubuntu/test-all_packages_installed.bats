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

@test "asdf should be successfully installed with apt" {
  run asdf --version
  [ "$?" -eq 0 ]
  dpkg --get-selections | grep asdf
  [ "$?" -eq 0 ]
}
