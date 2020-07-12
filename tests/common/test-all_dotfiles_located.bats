# /usr/bin/env bats

@test ".gitconfig should be successfully located on home directory" {
  [ -e ~/.gitconfig ]
}

@test ".gitignore should be successfully located on home directory" {
  [ -e ~/.gitignore ]
}

@test ".tmux.conf should be successfully located on home directory" {
  [ -e ~/.tmux.conf ]
}
