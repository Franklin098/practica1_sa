#
# Cookbook:: sample
# Recipe:: default
#
# Copyright:: 2020, The Authors, All Rights Reserved.

package 'apache2'
service 'apache2' do
action [:enable, :start]
end

