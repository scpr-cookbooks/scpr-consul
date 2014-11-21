default.scpr_consul.checks_dir = "/etc/consul_checks"

include_attribute "consul"

#default.consul.servers  = ["consul1.i.scprdev.org","consul2.i.scprdev.org","consul3.i.scprdev.org"]
default.consul.servers = ['127.0.0.1']
default.consul.ui_dir   = "/usr/local/consul_ui"

# FIXME: need to see why consul cookbook sets the agent to run as root
default.consul.service_user = 'root'
default.consul.service_group = 'root'

#----------

include_attribute 'dnsmasq'

default.dnsmasq.enable_dhcp = false
default.dnsmasq.dns_options = ["server=/consul/127.0.0.1#8600"]
default.dnsmasq.dns = {
  'server' => '127.0.0.1'
}



