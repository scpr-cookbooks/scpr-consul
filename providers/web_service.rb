action :create do
  directory node.scpr_consul.checks_dir do
    action    :create
    recursive true
  end

  # write our service check script...
  template "#{node.scpr_consul.checks_dir}/#{new_resource.name}" do
    action    :create
    source    "web_service_check.rb.erb"
    cookbook  "scpr-consul"
    mode      0755
    variables({
      resource: new_resource
    })
  end

  consul_service_def "#{new_resource.name}_web" do
    action    :create
    check({
      interval: '5s',
      script:   "#{node.scpr_consul.checks_dir}/#{new_resource.name}"
    })
    tags      ["web"]
    notifies  :reload, "service[consul]"
  end

end