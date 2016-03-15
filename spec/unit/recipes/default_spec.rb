#
# Cookbook Name:: rise-base
# Spec:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

require 'spec_helper'

describe 'rise-base::default' do
  context 'When all attributes are default, on an unspecified platform' do
    let(:chef_run) do
      runner = ChefSpec::ServerRunner.new
      runner.converge(described_recipe)
    end

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end
  end

  context 'when running the default recipe' do
  	let(:chef_run) do
  		runner = ChefSpec::ServerRunner.new(platform: 'centos', version: '6.7') do |node, server|
  			node.set['ns']['configure?'] = true
  		end
  		runner.converge(described_recipe)
  	end

  	it 'should install epel-release' do
  		expect(chef_run).to install_package('epel-release')
  	end

  	it 'should install wget' do
  		expect(chef_run).to install_package('wget')
  	end

  	it 'should install ntp' do
  		expect(chef_run).to install_package('ntp')
  	end

  	it 'should install ntpdate' do
  		expect(chef_run).to install_package('ntpdate')
  	end

  	it 'should create /etc/motd file' do
  		expect(chef_run).to create_cookbook_file('/etc/motd')
  	end

  	it 'should populate /etc/resolv.conf' do
  		expect(chef_run).to create_template('/etc/resolv.conf')
  	end

  end
end
