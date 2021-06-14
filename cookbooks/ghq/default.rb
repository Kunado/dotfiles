if node[:platform] == 'darwin'
  package 'ghq'
elsif node[:platform] == 'ubuntu'
  github_binary 'ghq' do
    repository 'motemen/ghq'
    version 'v1.1.4'
    asset "ghq_linux_amd64.zip"
    binary_path "ghq_linux_amd64/ghq"
  end
end

include_cookbook 'git'
