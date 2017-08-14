

httpd_config node['application']['name'] do
  source "site.conf.erb"
  notifies :restart, 'httpd_service[default]'
  action :create
end
