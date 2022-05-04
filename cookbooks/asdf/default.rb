include_cookbook 'zsh'

bin_path = '/usr/local/bin'
path = "#{bin_path}/.asdf"
repo = 'https://github.com/asdf-vm/asdf.git'

if node[:platform] == 'darwin'
  package 'asdf'
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
  git "asdf" do
    repository repo
    destination path
    not_if "test -f #{path}"
  end
end

dotfile '.tool-versions' do
  not_if "test -L #{ENV['HOME']}/.tool-versions"
end
