%w(var var/squid var/squid/logs var/squid/run).each do |d|
  directory "#{node[:release_dir]}/#{d}" do
    mode 00755
  end
end

template "#{node[:release_dir]}/etc/squid.conf" do
  mode 00600
  source "squid3.conf.erb"
  variables(:squid => "#{node[:release_dir]}",
            :vault => ENV['VAULT'])
end
