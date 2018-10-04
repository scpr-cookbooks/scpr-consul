default.scpr_consul.checks_dir = "/etc/consul_checks"

#----------

include_attribute 'dnsmasq'

default.dnsmasq.enable_dhcp = false
default.dnsmasq.dns_options = ["server=/consul/127.0.0.1#8600"]
default.dnsmasq.dns = {
  'server' => '127.0.0.1'
}

#----------

include_attribute 'consul'

default.consul.servers        = ['127.0.0.1']

# FIXME: need to see why consul cookbook sets the agent to run as root
default.consul.service_user   = 'root'
default.consul.service_group  = 'root'

default.consul.service_mode   = 'client'

default.consul.version        = "0.5.2"

# FIXME: Temporary location until PR #1 is safe to land
default.consul.base_url = "https://releases.hashicorp.com/consul/0.5.2/consul_%{version}.zip"

#----------
include_attribute "consul-template"

default.consul_template.base_url = "https://github.com/hashicorp/consul-template/archive/"
default.consul_template.version = "0.12.2"
default.consul_template.checksums = {
  'consul_template_0.12.2_linux_amd64' => '9dc6e3a7fa027d63d2de473bc2b5d5b4106381f1741f1acb707f42336af944b9',
}

default.consul_template.config = {
  consul: "localhost:8500",
}
