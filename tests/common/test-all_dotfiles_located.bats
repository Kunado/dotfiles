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

@test ".tmux should be successfully located on home directory" {
  [ -e ~/.tmux ]
}

@test ".zsh directory should be successfully located on home directory" {
  [ -e ~/.zsh ]
}

@test ".zshrc should be successfully located on home directory" {
  [ -e ~/.zshrc ]
}

@test ".zshrc.local.sample should be successfully located on home directory" {
  [ -e ~/.zshrc.local.sample ]
}
