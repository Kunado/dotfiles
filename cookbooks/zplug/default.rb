include_cookbook 'zsh'

bin_path = '/usr/local/bin'
path = "#{bin_path}/.zplug"
repo = 'https://github.com/zplug/zplug.git'

if node[:platform] == 'darwin'
  package 'zplug'
elsif node[:platform] == 'redhat'
  execute "mkdir -p #{bin_path}" do
    not_if "test -f #{bin_path}"
  end
  execute "git clone #{repo} #{path}" do
    not_if "test -f #{path}"
  end
else
  execute "mkdir -p #{bin_path}" do
    not_if "test -f #{bin_path}"
  end
  git "zplug" do
    repository repo
    destination path
    not_if "test -f #{path}"
  end
end
