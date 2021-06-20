bin_path = '/usr/local/bin'
path = "#{bin_path}/.powerline-shell"
repo = 'https://github.com/b-ryan/powerline-shell'

execute "mkdir -p #{bin_path}" do
  not_if "test -f #{bin_path}"
end

if node[:platform] == 'redhat'
  execute "git clone #{repo} #{path}" do
    not_if "test -f #{path}"
  end
else
  git "powerline-shell" do
    repository repo
    destination path
    not_if "test -f #{path}"
  end
end

execute "mkdir -p #{ENV['HOME']}/bin" do
  not_if "test -f #{ENV['HOME']}/bin"
end

execute "python setup.py install --home=#{ENV['HOME']}" do
  cwd path
end

execute "mkdir -p #{ENV['HOME']}/.config" do
  not_if "test -f #{ENV['HOME']}/.config"
end

dotfile '.config/powerline-shell'
