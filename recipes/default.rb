#
# Cookbook:: application_deployer
# Recipe:: default
#
# Copyright:: 2017, Wardish LLC, All Rights Reserved.
package "apr-util-pgsql"
package "bash-completion"

httpd_service 'default' do
  listen_addresses ["*"]
  action [:create, :start]
end

httpd_module 'dbd' do
  module_name 'dbd'
  action :create
end

httpd_module 'authn_dbd' do
  module_name 'authn_dbd'
  action :create
end

httpd_module 'rewrite' do
  module_name 'rewrite'
  action :create
end