# application_deployer
To deploy LL languages applications

## Requirements

### Chef

+ Chef 12.1+

## Attributes

<dl>
<dt >node['application']['db']['name'] &nbsp; <span style="color: red;">*required for init_db</span></dt>
<dd>Database name.</dd>
<dt >node['application']['db']['user'] &nbsp; <span style="color: red;">*required for init_db</span></dt>
<dd>Database user name.</dd>
<dt>node['applictaion']['db']['password'] &nbsp; <span style="color: red;">*required for init_db</span></dt>
<dd>Database user password</dd>
<dt>node['application']['base_dir']</dt>
<dd>CodeIgniter directory.</dd>
<dt>node['application']['public_dir']</dt>
<dd>DcoumentRoot of application.</dd>
<dt>node['application']['service_name']</dt>
<dd>Name of httpd service suffix. (on centos7)</dd>
<dt>node['application']['name']</dt>
<dd>Application name.(firest directory of url)</dd>
<dt>node['application']['auth']['type']</dt>
<dd>Type of Authentication resource. <code>ldap</code> or <code>db</code>　(db is pgsql)</dd>
<dt>node['application']['auth']['name'] &nbsp; <span style="color: red;">*required, if auth type is not nil</span></dt>
<dd>Message on authentication dialog</dd>
<dt>node['application']['auth']['db']['table'] &nbsp; <span style="color: red;">*required, if auth type is db</span></dt>
<dd>authentication source table.</dd>
<dt>node['application']['auth']['db']['id_field'] &nbsp; <span style="color: red;">*required, if auth type is db</span></dt>
<dd>userid field on table.</dd>
<dt>node['application']['auth']['db']['id_field'] &nbsp; <span style="color: red;">*required, if auth type is db</span></dt>
<dd>passowrd field on table.</dd>

</dl>

```ruby
default['application']['db']['name'] = ''
default['application']['db']['user'] = default['application']['db']['name']
default['applictaion']['db']['password'] = ''
default['application']['base_dir'] = '/vagrant/modules/codeigniter'
default['application']['public_dir'] = default['application']['base_dir'] + '/public'
default['application']['service_name'] = 'default'
default['application']['name'] = ''
default['application']['auth']['type'] = false
default['application']['auth']['name'] = ''
default['application']['auth']['db']['table'] = 'tb_account'
default['application']['auth']['db']['id_field'] = 'user_id'
default['application']['auth']['db']['id_field'] = 'passowrd'
```

## Recipes
|name|action|
|----|----|
|default|Set up a PHP & httpd modules. |
|init_db|Create DB, and Create User on PostgreSQL|
|deploy|Create a config file to httpd directory.|

## Usage Example

```ruby
      "application" => {
        "db" => {
          "name" => "wardishdir02",
          "password" => "wardishdir02"
        },
        "base_dir" => "/vagrant/apps/codeigniter",
        "name" => "wardishdir",
        "auth" => {
          "type" => "db",
          "name" => "Basic Authentication.",
          "db" => {
            "password_field" => "password",
            "id_field" => "login_name",
            "table" => "tb_user"
          }
        }
      }
```

## License & Authors

**Author:** Wardish,LLC ([www.wardish.jp](http://www.wardish.jp))

**Copyright:** 2007-2017, Wardish,LLC.

```
Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
```