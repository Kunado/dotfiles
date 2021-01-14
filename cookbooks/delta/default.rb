version = '0.5.0-1'
package = "delta-diff_#{version}_amd64_debian_buster.deb"
release = "https://github.com/barnumbirr/delta-debian/releases/download/#{version}/#{package}"

if node[:platform] == 'darwin'
  package 'delta'
elsif node[:platform] == 'ubuntu'
  execute "curl -OL #{release} && dpkg -i #{package} && rm #{package}"
end
