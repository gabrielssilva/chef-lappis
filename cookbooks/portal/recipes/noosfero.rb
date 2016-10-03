#
# Cookbook Name:: portal
# Recipe:: noosfero
#

cookbook_file '/etc/apt/sources.list.d/noosfero.list'
execute 'apt-get update'

user 'noosfero'

2.times do
  package 'noosfero' do
    options '--force-yes --fix-missing'
    ignore_failure true
  end
end

template '/etc/noosfero/database.yml' do
  group 'noosfero'
  mode '0640'
end

service 'noosfero' do
  action [:enable, :start]
end