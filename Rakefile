require 'yaml'
environment = "lappis"

ssh_config_file = "config/#{environment}/ssh_config"
ips_file = "config/#{environment}/ips.yaml"
passwd_file = "config/#{environment}/passwd.yaml"
certificate_domains_file = "config/#{environment}/certificate_domains.yaml"

ENV['CHAKE_SSH_CONFIG'] = ssh_config_file
ENV['CHAKE_RSYNC_OPTIONS'] = " --exclude backups"

require "chake"

ips ||= YAML.load_file(ips_file)
passwords ||= YAML.load_file(passwd_file)
crt_domains ||= YAML.load_file(certificate_domains_file)

node.data['remote_db'] = ENV['REMOTE_DB'] || nil
$nodes.each do |node|
  node.data['peers'] = ips
  node.data['passwd'] = passwords
  node.data['crt_domains'] = crt_domains
end

def ssh_cmd(cmd, host)
  sh 'ssh', '-F', ENV['CHAKE_SSH_CONFIG'], host, cmd
end

def scp_cmd(file, dest, host, flags='')
  sh 'scp', flags,'-F', ENV['CHAKE_SSH_CONFIG'], file, "#{host}:#{dest}"
end
Rake.add_rakelib 'lib/tasks'
