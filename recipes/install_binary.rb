#
# Cookbook:: consul-template
# Recipe:: install_binary
#
# Copyright:: (C) 2014
#
#
#

package 'unzip'

remote_file "#{Chef::Config[:file_cache_path]}/consul-template-#{node['consul_template']['version']}.zip" do
  source "https://releases.hashicorp.com/consul-template/#{node['consul_template']['version']}/consul-template_#{node['consul_template']['version']}_linux_amd64.zip"
  checksum ConsulTemplateHelpers.install_checksum(node)
  action :create_if_missing
  notifies :run, 'bash[extract consul-template]', :immediately
end

bash 'extract consul-template' do
  action :nothing
  code <<~EOH
    unzip -o "#{Chef::Config[:file_cache_path]}/consul-template-#{node['consul_template']['version']}.zip" -d /usr/local/bin
  EOH
end
