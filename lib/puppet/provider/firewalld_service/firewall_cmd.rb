Puppet::Type.type(:firewalld_service).provide('firewall_cmd') do
  commands :firewall_cmd => '/usr/bin/firewalld'

  def firewalld_reload
    output = %x{`/usr/bin/firewalld --reload 2>&1`}
    raise Puppet::Error, "Failed to reload firewall changes for #{@resource[:service]} : #{output}" unless $?.success?
  end

  def exists?
    firewall_cmd('--list-services').split(' ').include?(@resource[:service])
  end

  def create
    rule=@resource[:service]
    firewall_cmd('--permanent','--add-service', rule)
    firewalld_reload
  end

  def destroy
    rule=@resource[:service]
    firewall_cmd('--permanent','--add-service', rule)
    firewalld_reload
  end
end
