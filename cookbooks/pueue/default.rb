if node[:platform] == 'darwin'
  package 'pueue'
elsif node[:platform] == 'ubuntu' || node[:platform] == 'redhat'
  github_binary 'pueue' do
    repository 'Nukesor/pueue'
    version 'v0.12.2'
    asset "pueue-linux-x86_64"
    binary_path "pueue-linux-x86_64"
  end

  github_binary 'pueued' do
    repository 'Nukesor/pueue'
    version 'v0.12.2'
    asset "pueued-linux-x86_64"
    binary_path "pueued-linux-x86_64"
  end
end
