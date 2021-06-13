if node[:platform] == 'darwin'
  package 'lsd'
elsif node[:platform] == 'ubuntu' || node[:platform] == 'redhat'
  github_binary 'lsd' do
    repository 'peltoche/lsd'
    version '0.20.1'
    asset 'lsd-0.20.1-x86_64-unknown-linux-gnu.tar.gz'
    binary_path 'lsd-0.20.1-x86_64-unknown-linux-gnu/lsd'
  end
end
