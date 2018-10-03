name             'scpr-consul'
maintainer       'Southern California Public Radio'
maintainer_email 'erichardson@scpr.org'
license          'all_rights'
description      'Installs/Configures scpr-consul'
long_description 'Installs/Configures scpr-consul'
version          '0.2.5'

depends "consul", "~> 0.11"
depends "consul-template", "~> 0.9.1"
depends "dnsmasq"