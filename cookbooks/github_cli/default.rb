if node[:platform] == 'darwin'
  package 'gh'
elsif node[:platform] == 'ubuntu' || node[:platform] == 'redhat'
  github_binary 'gh' do
    repository 'cli/cli'
    version 'v1.11.0'
    asset "gh_1.11.0_linux_amd64.tar.gz"
    binary_path "gh_1.11.0_linux_amd64/bin/gh"
  end
end
