#
# Cookbook:: sample
# Recipe:: default
#
# Copyright:: 2020, The Authors, All Rights Reserved.

package 'apache2'
service 'apache2' do
action [:enable, :start]
end


package 'git'
service 'git' do
action [:enable, :start]
end


remote_directory "/var/www/html" do
    source 'local_directory' # <-- this is your directory in files/default/local_directory
    files_owner 'root'                                                                 
    files_group 'root'
    files_mode '0750'
    action :create
    recursive true                                                                      
  end  