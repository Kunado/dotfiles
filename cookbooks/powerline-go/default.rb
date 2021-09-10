build = 'darwin' if node[:platform] == 'darwin'
build = 'linux' if node[:platform] == 'ubuntu' || node[:platform] == 'redhat'

github_binary 'powerline-go' do
  repository 'justjanne/powerline-go'
  version 'v1.21.0'
  asset "powerline-go-#{build}-amd64"
  binary_path "powerline-go-#{build}-amd64"
end
