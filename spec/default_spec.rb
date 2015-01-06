require 'spec_helper'

describe 'nfdump::default' do
  let(:chef_run) { ChefSpec::SoloRunner.converge(described_recipe) }

  it 'installs nfdump' do
    expect(chef_run).to install_package('nfdump')
  end
end

describe 'nfdump::nfcapd' do
  let(:chef_run) { ChefSpec::SoloRunner.converge(described_recipe) }

  it 'enables nfcapd with runit' do
    expect(chef_run).to enable_runit_service('nfcapd')
  end

  it 'creates datadir for nfcapd' do
    expect(chef_run).to create_directory('/var/cache/nfdump')
  end
end
