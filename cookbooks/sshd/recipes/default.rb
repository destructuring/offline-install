%w(var/sshd).each do |d|
  directory "#{node[:release_dir]}/#{d}" do
    mode 00755
  end
end

template "#{node[:release_dir]}/etc/sshd_config" do
  mode 00600
  source "sshd_config.erb"
end
