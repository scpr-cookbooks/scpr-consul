name             'scpr-consul'
maintainer       'Southern California Public Radio'
maintainer_email 'erichardson@scpr.org'
license          'all_rights'
description      'Installs/Configures scpr-consul'
long_description 'Installs/Configures scpr-consul'
version          '0.3.0'

depends "consul", "~> 1.4"
depends "consul-template", "~> 0.8.0"
depends "dnsmasq"