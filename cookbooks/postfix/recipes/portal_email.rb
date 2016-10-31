include_recipe 'postfix::default'

cookbook_file '/etc/postfix/main.cf' do
  source 'portal_main.cf'
end

cookbook_file '/etc/postfix/virtual' do
  mode 400
end

execute 'postmap /etc/postfix/virtual' do
  notifies :restart, 'service[postfix]'
end
