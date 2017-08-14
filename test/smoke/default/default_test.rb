# # encoding: utf-8

# Inspec test for recipe wardish_ci_app::default

# The Inspec reference, with examples and extensive documentation, can be
# found at http://inspec.io/docs/reference/resources/
require 'serverspec'
set :backend, :exec

unless os.windows?
  # This is an example test, replace with your own test.
  describe user('root'), :skip do
    it { should exist }
  end
end

# This is an example test, replace it with your own test.
describe port(80), :skip do
  it { should_not be_listening }
end

%w(php php-pear php-cli php-mbstring php-pdo php-pgsql php-common php-xml).each do |pkg|
  describe package(pkg) do
    it { should be_installed }
  end
end
