#
# Cookbook:: application_deployer
# Recipe:: init_codeigniter
#
# Copyright:: 2017, Wardish LLC, All Rights Reserved.

script "install_codeigniter" do
  not_if        "[ -d /vagrant/apps/codeigniter ]"
#  user          "root"
  interpreter   "bash"
  code <<-"EOS"
    cd "/vagrant/apps/"
    composer create-project kenjis/codeigniter-composer-installer codeigniter
  EOS
end
