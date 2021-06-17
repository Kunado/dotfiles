if node[:platform] == 'darwin' || node[:platform] == 'ubuntu'
  package 'neovim'
elsif node[:platform] == 'redhat'
  github_binary 'nvim' do
    repository 'neovim/neovim'
    version 'v0.4.3'
    archive 'nvim-linux64.tar.gz'
    binary_path 'nvim-linux64/bin/nvim'
  end
end

execute "mkdir -p #{ENV['HOME']}/.config" do
  not_if "test -f #{ENV['HOME']}/.config"
end

dotfile '.config/nvim'
dotfile '.config/coc'
