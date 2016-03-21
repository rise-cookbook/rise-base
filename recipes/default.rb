#
# Cookbook Name:: basePackages
# Recipe:: default
#
# Copyright 2014, Rise
#
# All rights reserved - Do Not Redistribute
#

package %w(epel-release wget ntp ntpdate)do 
  action :install
end


#package "epel-release" do
#  action :install
#end

#package "wget" do
#  action :install
#end

#package "ntp" do
#  action :install
#end

#package "ntpdate" do
#  action :install
#end

cookbook_file "/etc/motd" do
  source 'motd'
  action :create
end

  template "/etc/resolv.conf" do
    source "resolv.conf.erb"
    variables(
      :nameservers => node['ns']['local']
    )
    action :create
    only_if { node['ns']['configure?'] }
  end
