#
# Cookbook Name:: scpr-consul
# Recipe:: server
#
# Copyright (c) 2014 Southern California Public Radio, All Rights Reserved.

node.set.consul.service_mode = "cluster"

include_recipe "consul"