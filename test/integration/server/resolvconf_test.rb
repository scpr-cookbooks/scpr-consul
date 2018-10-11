describe directory('/etc/default/resolvconf') do
  its('content') { should match /TRUNCATE_NAMESERVER_LIST_AFTER_LOOPBACK_ADDRESS=no/ }
end
