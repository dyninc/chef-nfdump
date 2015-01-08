require 'spec_helper'

describe 'nfdump::default' do
  let(:chef_run) { ChefSpec::SoloRunner.converge(described_recipe) }
  it 'installs nfdump' do
    expect(chef_run).to install_package('nfdump')
  end
end

describe 'nfdump::nfcapd' do
  let(:chef_run) do
    ChefSpec::SoloRunner.new(step_into: ['nfdump_nfcapd']).converge('nfdump::nfcapd')
  end

  before do
    stub_data_bag('nfcapd').and_return(['router1', 'router2'])
    stub_data_bag_item('nfcapd', 'router1').and_return({id: 'router1', port: 9995, datadir: '/flows'})
    stub_data_bag_item('nfcapd', 'router2').and_return({id: 'router2', port: 9996})
  end

  it 'creates datadir for nfcapd' do
    expect(chef_run).to create_directory('/var/cache/nfdump')
  end

  it 'creates runit service for router1' do
    expect(chef_run).to enable_nfdump_nfcapd('router1')
    expect(chef_run).to enable_runit_service('nfcapd-router1')
  end

  it 'creates runit service for router2' do
    expect(chef_run).to enable_nfdump_nfcapd('router2')
    expect(chef_run).to enable_runit_service('nfcapd-router2')
  end
end
