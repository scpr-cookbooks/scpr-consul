#
# Cookbook Name:: scpr-consul
# Recipe:: default
#
# Copyright (c) 2014 Southern California Public Radio, All Rights Reserved.

# Configure a Consul client

include_recipe "consul"

# -- Install dnsmasq -- #

file "/etc/default/resolvconf" do
  action :create
  content "TRUNCATE_NAMESERVER_LIST_AFTER_LOOPBACK_ADDRESS=no"
end

include_recipe "dnsmasq"

# add service checks...

directory node.scpr_consul.checks_dir do
  action    :create
  recursive true
end

if node.consul.service_mode == 'cluster'
  include_recipe "consul::ui"
end