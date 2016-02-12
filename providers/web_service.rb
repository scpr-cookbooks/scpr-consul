action :create do
  if new_resource.name_suffix
    svc_name = "#{new_resource.name}_#{new_resource.name_suffix}"
  else
    svc_name = new_resource.name
  end

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

  consul_definition svc_name do
    action :create
    type 'service'
    user node.consul.service_user
    group node.consul.service_group
    parameters({
      port: new_resource.port.to_i,
      checks: [{
        interval: '5s',
        script:   "#{node.scpr_consul.checks_dir}/#{new_resource.name}",
      }],
      tags: new_resource.tags||[],
    })

    notifies  :reload, "consul_service[consul]", :delayed
  end

end