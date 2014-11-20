#
# Cookbook Name:: scpr-consul
# Recipe:: default
#
# Copyright (c) 2014 Southern California Public Radio, All Rights Reserved.

# Configure a Consul client

node.override.consul.service_mode = "client"
include_recipe "consul"

# add service checks...