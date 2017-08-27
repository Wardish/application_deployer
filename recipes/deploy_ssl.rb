script "copy key files" do
  user          "root"
  interpreter   "bash"
  code <<-"EOS"
    cp /vagrant/resources/server.key /etc/httpd-default/
    cp /vagrant/resources/server.crt /etc/httpd-default/
    cp /vagrant/resources/ca.key /etc/httpd-default/
  EOS
end

httpd_config node['application']['name'] do
  source "site_ssl.conf.erb"
  notifies :restart, 'httpd_service[default]'
  action :create
end


