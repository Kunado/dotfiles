if node[:platform] == 'darwin'
  package 'fzf'
else
  bin_path = '/usr/local/bin'
  path = "#{bin_path}/.fzf"
  repo = 'https://github.com/junegunn/fzf.git'

  execute "mkdir -p #{bin_path}" do
    not_if "test -f #{bin_path}"
  end

  if node[:platform] == 'redhat'
    execute "git clone --depth 1 #{repo} #{path}" do
      not_if "test -f #{path}"
    end
  else
    git "fzf" do
      repository repo
      destination path
      not_if "test -f #{path}"
      depth 1
    end
  end
  execute "#{path}/install" do
    only_if "test -f #{path}"
  end
end
