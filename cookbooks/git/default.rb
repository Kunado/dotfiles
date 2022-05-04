package 'git'

if node[:platform] == 'darwin'
  file(gitconfig = File.join(ENV['HOME'], '.gitconfig')) do
    action :delete
    only_if { File.file?(gitconfig) && !File.symlink?(gitconfig) }
  end
end

dotfile '.gitconfig' do
  not_if "test -L #{ENV['HOME']}/.gitconfig"
end

dotfile '.gitignore' do
  not_if "test -L #{ENV['HOME']}/.gitignore"
end

dotfile '.git_template' do
  not_if "test -L #{ENV['HOME']}/.git_template"
end
