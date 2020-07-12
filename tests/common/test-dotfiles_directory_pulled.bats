# /usr/bin/env bats

@test "dotfiles directory should exist" {
  [ -e ~/dev/src/github.com/kunado/dotfiles ]
}

@test "dotfiles config directory should exist" {
  [ -e ~/dev/src/github.com/kunado/dotfiles/config ]
}
