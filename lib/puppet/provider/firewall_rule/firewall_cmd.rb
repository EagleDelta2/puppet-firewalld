Puppet::Type.type(:firewall_rule).provide('firewall_cmd') do
  
  commands :firewall_cmd => 'firewall-cmd'
  
end