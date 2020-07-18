# /usr/bin/env bats

@test ".zshrc.local.darwin should be successfully located on home directory" {
  [ -e ~/.zshrc.local.darwin ]
}
