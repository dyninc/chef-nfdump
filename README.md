# Nfdump Cookbook

Installs nfdump and configures nfcapd on Debian (tested on 7.6) or Ubuntu (tested on 14.04).

# Requirements

## Cookbooks

  * runit
  * chef-sugar
  * apt

## Platforms

The following platforms have been tested using test-kitchen

  * Ubuntu 14.04
  * Debian 7.6

# Attributes

  * `node['nfdump']['nfcapd']['datadir']` Default place to keep the nfcapd data files
  * `node['nfdump']['nfcapd']['piddir']` The location under which to keep PID files

# Recipes

  * `nfdump::default` Install the nfdump package
  * `nfdump::nfcapd` Creates the default datadir and calls nfdump_nfcapd for each item in the nfcapd data bag

# Resources

## nfdump_nfcapd

Create an nfcapd instance under runit - See nfdump::nfcapd for a full example of use

### Parameters

  * `name` Name to identify the runit service created
  * `port` Port for nfcapd to listen on (default 9995)
  * `datadir` Defaults to `node['nfdump']['nfcapd']['datadir']` if not specified

### Actions

Actions are analogous to the same actions from the runit resource, supported actions are `enable`, `disable`, `start`, `stop`, `restart`.

### Example
```ruby
nfdump_nfcapd 'router1' do
  name 'router1'
  port 9995
  datadir '/dev/null'
  action :enable
end
```

    

# License and Authors

  * Author:: Paul Thomas <pthomas@dyn.com>

  * Copyright:: 2015, Dyn Inc

Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except in compliance with the License. You may obtain a copy of the License at http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.
