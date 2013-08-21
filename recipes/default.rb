#
# Cookbook Name:: php-fpm
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

package "php-fpm" do
  action :install
end

template "www.conf" do
  path "#{node['php-fpm']['conf_dir']}/www.conf"
  owner "root"
  group "root"
  mode 644
  notifies :restart, 'service[php-fpm]'
end

service "php-fpm" do
  action [:enable, :start]
end

