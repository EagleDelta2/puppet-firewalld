Puppet::Type.type(:firewalld_port).provide('firewall_cmd') do
  
  commands :firewall_cmd => '/usr/bin/firewall-cmd'
  
  def exists?
    firewall_cmd('--list-ports').split(' ').include?("#{resource[:port]}/#{resource[:protocol]}")
  end
  
  def create
    rule="#{resource[:port]}/#{resource[:protocol]}"
    firewall_cmd('--permanent','--add-port', rule)
    firewall_cmd('--reload')
  end
  
  def destroy
    rule="#{resource[:port]}/#{resource[:protocol]}"
    firewall_cmd('--permanent','--remove-port', rule)
    firewall_cmd('--reload')
  end
  
end