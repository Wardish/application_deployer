# application_deployer
To deploy LL languages applications

## Requirements

### Chef

+ Chef 12.1+

## Attributes

The following attributes are required

```ruby
default['application']['db']['name'] = 'Database name & db username'
default['applictaion']['db']['password'] = 'Database user password'
default['application']['dir'] = 'application directory'
default['application']['name'] = 'application name used by top level url directory'
default['application']['auth']['name'] = 'Message on Basic Authentication dialog'
default['application']['auth']['db']['table'] = 'authentication source table'
default['application']['auth']['db']['id_field'] = 'userid field on table'
default['application']['auth']['db']['id_field'] = 'passowrd field on table'
```

## Recipes
* default
* init_db
* deploy

## Usage Example

```ruby
      "application" => {
        "db" => {
          "name" => "wardishdir02",
          "password" => "wardishdir02"
        },
        "dir" => "/vagrant/apps/codeigniter",
        "name" => "wardishdir",
        "auth" => {
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