include_cookbook 'tmux'

tmux_path = "#{ENV['HOME']}/.tmux"
path = "#{tmux_path}/plugins/tpm"
repo = 'https://github.com/tmux-plugins/tpm.git'

execute "mkdir -p #{tmux_path}" do
  not_if "test -f #{tmux_path}"
end
git "tpm" do
  repository repo
  destination path
  not_if "test -f #{path}"
end
