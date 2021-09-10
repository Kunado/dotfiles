build = 'apple-darwin' if node[:platform] == 'darwin'
build = 'unknown-linux-musl' if node[:platform] == 'ubuntu' || node[:platform] == 'redhat'

github_binary 'zellij' do
  repository 'zellij-org/zellij'
  version 'v0.16.0'
  asset "zellij-x86_64-#{build}.tar.gz"
  binary_path "zellij-x86_64-#{build}.tar.gz"
end
