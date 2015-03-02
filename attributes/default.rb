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

# these can be removed when the consul cookbook next bumps and includes them
default.consul.checksums['0.5.0_darwin_amd64'] = '24d9758c873e9124e0ce266f118078f87ba8d8363ab16c2e59a3cd197b77e964',
default.consul.checksums['0.5.0_linux_386']    = '4b6147c30596a30361d4753d409f8a1af9518f54f5ed473a4c4ac973738ac0fd',
default.consul.checksums['0.5.0_linux_amd64']  = '161f2a8803e31550bd92a00e95a3a517aa949714c19d3124c46e56cfdc97b088',
default.consul.checksums['0.5.0_web_ui']       = '0081d08be9c0b1172939e92af5a7cf9ba4f90e54fae24a353299503b24bb8be9'