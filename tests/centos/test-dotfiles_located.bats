# /usr/bin/env bats

@test ".zshrc.local.redhat should be successfully located on home directory" {
  [ -e ~/.zshrc.local.redhat ]
}
