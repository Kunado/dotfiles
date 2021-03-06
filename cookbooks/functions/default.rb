define :dotfile, source: nil do
  source = params[:source] || params[:name]
  link File.join(ENV['HOME'], params[:name]) do
    to File.expand_path("../../../config/#{source}", __FILE__)
    #user node[:user]
  end
end

define :github_binary, version: nil, repository: nil, asset: nil, binary_path: nil do
  cmd = params[:name]
  bin_path = "#{ENV['HOME']}/bin/#{cmd}"
  asset = params[:asset]
  archived = false
  url = "https://github.com/#{params[:repository]}/releases/download/#{params[:version]}/#{asset}"

  if asset.end_with?('.zip')
    extract = "unzip -o"
    archived = true
  elsif asset.end_with?('.tar.gz')
    extract = "tar xvzf"
    archived = true
  #else
  #  raise "unexpected ext asset: #{asset}"
  end

  execute "mkdir -p #{ENV['HOME']}/bin/" do
    not_if "test -f #{ENV['HOME']}/bin/"
  end

  execute "curl -fSL -o /tmp/#{asset} #{url}" do
    not_if "test -f #{bin_path}"
  end

  if archived
    execute "#{extract} /tmp/#{asset}" do
      not_if "test -f #{bin_path}"
      cwd "/tmp"
    end
  end

  execute "mv /tmp/#{params[:binary_path] || cmd} #{bin_path} && chmod +x #{bin_path}" do
    not_if "test -f #{bin_path}"
  end
end
