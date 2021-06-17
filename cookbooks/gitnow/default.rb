if node[:platform] == 'darwin'
  package 'git-now'
else
  bin_path = '/usr/local/bin'
  path = "#{bin_path}/git-now"
  repo = 'https://github.com/iwata/git-now'

  execute "mkdir -p #{bin_path}" do
    not_if "test -f #{bin_path}"
  end

  git "git-now" do
    repository repo
    recursive True
  end

  execute "make install" do
    only_if "test -f #{path}"
    cwd "#{path}"
  end
end
