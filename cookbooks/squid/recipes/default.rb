template "#{node[:release_dir]}/etc/squid.conf" do
  mode 00600
  source "squid.conf.erb"
  variables(:squid => "#{node[:release_dir]}")
end
