if node[:platform] == 'darwin' || node[:platform] == 'ubuntu'
  package 'direnv'
else
  execute 'curl -sfL https://direnv.net/install.sh | bash'
end
