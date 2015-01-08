#
# Cookbook Name:: nfdump
# Recipe:: nfcapd
#
# Copyright 2015, Dyn Inc.
#
# Licensed under the Apache License, Version 2.0 (the 'License');
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an 'AS IS' BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

include_recipe 'nfdump::default'
include_recipe 'runit::default'
include_recipe 'chef-sugar'

service 'nfdump' do
  action [:stop, :disable]
  only_if { ubuntu? }
end

directory node['nfdump']['nfcapd']['datadir'] do
  action :create
end

data_bag('nfcapd').each do |id|
  item = data_bag_item('nfcapd', id)

  directory item['datadir'] if item.key? 'datadir'

  nfdump_nfcapd item['id'] do
    port item['port']
    datadir item['datadir'] || node['nfdump']['nfcapd']['datadir']
    action :enable
  end
end
