action :create do
  svc_name = if new_resource.name_suffix
               "#{new_resource.name}_#{new_resource.name_suffix}"
             else
               new_resource.name
             end

  directory node.scpr_consul.checks_dir do
    action    :create
    recursive true
  end

  # write our service check script...
  template "#{node.scpr_consul.checks_dir}/#{new_resource.name}" do
    action    :create
    source    'web_service_check.rb.erb'
    cookbook  'scpr-consul'
    mode      0755
    variables(
      resource: new_resource
    )
  end

  consul_service_def svc_name do
    action :create
    check(
      interval: '5s',
      script:   "#{node.scpr_consul.checks_dir}/#{new_resource.name}"
    )

    port new_resource.port.to_i

    tags new_resource.tags if new_resource.tags

    notifies :reload, 'service[consul]'
  end
end
