# /usr/bin/env bats

@test ".zshrc.local.ubuntu should be successfully located on home directory" {
  [ -e ~/.zshrc.local.ubuntu ]
}
