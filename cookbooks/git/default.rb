package 'git'

if node[:platform] == 'darwin'
  file(gitconfig = File.join(ENV['HOME'], '.gitconfig')) do
    action :delete
    only_if { File.file?(gitconfig) && !File.symlink?(gitconfig) }
  end
end

dotfile '.gitconfig' do
  not_if "test -f #{ENV['HOME']}/.gitconfig"
end
dotfile '.gitignore' do
  not_if "test -f #{ENV['HOME']}/.gitignore"
end
