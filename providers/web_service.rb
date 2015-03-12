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

  consul_service_def svc_name do
    action    :create
    check({
      interval: '5s',
      script:   "#{node.scpr_consul.checks_dir}/#{new_resource.name}"
    })

    if new_resource.tags
      tags      new_resource.tags
    end

    notifies  :reload, "service[consul]"
  end

end