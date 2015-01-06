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

  * `node['nfdump']['nfcapd']['datadir']` Where to place the nfcapd data files
  * `node['nfdump']['nfcapd']['pidfile']` Location for the PID file

# Recipes

  * `nfdump::default` Install the nfdump package
  * `nfdump::nfcapd` Configures nfcapd under runit and ensures datadir exists

# License and Authors

  * Author:: Paul Thomas <pthomas@dyn.com>

  * Copyright:: 2015, Dyn Inc

Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except in compliance with the License. You may obtain a copy of the License at http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.
