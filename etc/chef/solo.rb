require 'tvdinner'

shome = File.expand_path("../../..", __FILE__)
local_config shome
bundler_config "#{shome}/cookbooks"

data_bag_path platform_specific_path("#{shome}/data_bags")

require 'chef/handler/json_file'
report_handlers << Chef::Handler::JsonFile.new(:path => "#{shome}/var/chef/reports")
exception_handlers << Chef::Handler::JsonFile.new(:path => "#{shome}/var/chef/reports")
