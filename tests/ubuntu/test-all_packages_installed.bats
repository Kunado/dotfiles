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
