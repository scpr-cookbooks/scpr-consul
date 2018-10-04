name             'scpr-consul'
maintainer       'Southern California Public Radio'
maintainer_email 'erichardson@scpr.org'
source_url       'https://github.com/scpr-cookbooks/scpr-consul/'
issues_url       'https://github.com/scpr-cookbooks/scpr-consul/issues'
license          'All rights reserved'
description      'Installs/Configures scpr-consul'
long_description 'Installs/Configures scpr-consul'
supports         'ubuntu'
version          '0.2.9'

depends "consul", "~> 0.11"
depends "consul-template", "~> 0.9.1"
depends "dnsmasq"
