Puppet::Type.type(:firewalld_service).provide('firewall_cmd') do
  commands :firewall_cmd => '/usr/bin/firewalld'

  def exists?
    firewall_cmd('--list-services').split(' ').include?(resource[:service])
  end

  def create
    rule=resource[:service]
    firewall_cmd('--permanent','--add-service', rule)
    firewall_cmd('--reload')
  end

  def destroy
    rule=resource[:service]
    firewall_cmd('--permanent','--add-service', rule)
    firewall_cmd('--reload')
  end
end
