#
# Cookbook Name:: basePackages
# Recipe:: default
#
# Copyright 2014, Rise
#
# All rights reserved - Do Not Redistribute
#

package "epel-release" do
  action :install
end

package "wget" do
  action :install
end

package "ntp" do
  action :install
end

package "ntpdate" do
  action :install
end

cookbook_file "/etc/motd" do
  source 'motd'
  action :create
end

if node['ns']['configure?']
    template "/etc/resolv.conf" do
      source "resolv.conf.erb"
      variables(
        :nameservers => node['ns']['local']
        )
      action :create
    end
end