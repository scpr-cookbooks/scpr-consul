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

# these can be removed when the consul cookbook next bumps and includes them
default.consul.checksums['0.5.0_darwin_amd64'] = '24d9758c873e9124e0ce266f118078f87ba8d8363ab16c2e59a3cd197b77e964',
default.consul.checksums['0.5.0_linux_386']    = '4b6147c30596a30361d4753d409f8a1af9518f54f5ed473a4c4ac973738ac0fd',
default.consul.checksums['0.5.0_linux_amd64']  = '161f2a8803e31550bd92a00e95a3a517aa949714c19d3124c46e56cfdc97b088',
default.consul.checksums['0.5.0_web_ui']       = '0081d08be9c0b1172939e92af5a7cf9ba4f90e54fae24a353299503b24bb8be9'

#----------

include_attribute "consul-template"

default.consul_template.base_url = "https://s3-us-west-2.amazonaws.com/scpr-binaries/consul-template/"
default.consul_template.version = "0.12.2"
default.consul_template.checksums = {
  'consul-template_0.7.0_linux_amd64' => '7b8fb97caef72f9e67bbb9069042b8e01f7efed3acd2a32f560a8fe60146d874',
  'consul-template_0.12.2_linux_amd64' => '525b7ea6a2912c67ab9fcebb603b60d9ab69ed572d6a753803f8c46badec10da',
}

default.consul_template.config = {
  consul: "localhost:8500",
}