#
# Cookbook:: application_deployer
# Recipe:: default
#
# Copyright:: 2017, Wardish LLC, All Rights Reserved.
package "apr-util-pgsql"
package "bash-completion"

httpd_module 'php' do
  package_name 'php'
  module_name 'php-zts'
  action :create
end

node['apache']['modules'].each do |httpd_module|
  httpd_module httpd_module do
    module_name httpd_module
    action :create
  end
end

script "Copy php.ini" do
  user          "root"
  interpreter   "bash"
  code <<-"EOS"
    sed 's/\\/lib64\\/php/\\/lib64\\/php-zts/g' /etc/php.ini > /etc/php-zts.ini
  EOS
end

httpd_service node['application']['service_name'] do
  listen_addresses ["*"]
  action [:create, :start]
end

script "Httpd use php-zts" do
  user          "root"
  interpreter   "bash"
  code <<-"EOS"
    echo "PHPIniDir /etc/php-zts.ini" >> /etc/httpd-default/conf.modules.d/php-zts.load
  EOS
end
