name 'application_deployer'
maintainer 'Tetsuya Mito'
maintainer_email 'tetsuya@wardish.jp'
license 'Apache v2.0'
description 'Installs/Configures application_deployer'
long_description 'Installs/Configures application_deployer'
version '2.0.3'
chef_version '>= 12.1' if respond_to?(:chef_version)

depends    'postgresql'
depends    'yum-remi-chef'
depends    'php'
depends    'composer'
depends    'httpd'
depends    'firewalld'

supports "amazon"
supports "centos"
supports "ubuntu"

recipe 'application_deployer', 'Install packages'
recipe 'application_deployer::init_db', 'Create database for application (rebuild)'
recipe 'application_deployer::deploy', 'Deploy application'