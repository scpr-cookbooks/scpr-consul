
# install the default consul recipe, which bootstraps a server
include_recipe "consul::default"

# create a directory
directory "/scpr/testing" do
  action :create
  recursive true
end

# set up our web service
scpr_consul_web_service "scpr_testing" do
  action :create
  dir "/scpr/testing/current"
  hostname "scpr-testing.kitchen"
  interval "5s"
end

