default.scpr_consul.checks_dir = "/etc/consul_checks"

include_attribute "consul"

#default.consul.servers  = ["consul1.i.scprdev.org","consul2.i.scprdev.org","consul3.i.scprdev.org"]
default.consul.servers = ['127.0.0.1']
default.consul.ui_dir   = "/usr/local/consul_ui"