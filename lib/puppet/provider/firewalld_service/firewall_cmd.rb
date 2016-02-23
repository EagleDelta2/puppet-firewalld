Puppet::Type.type(:firewalld_service).provide('firewall_cmd') do
  commands :firewall_cmd => '/usr/bin/firewalld'

  def firewalld_reload
    output = %x{`/usr/bin/firewalld --reload 2>&1`}
    raise Puppet::Error, "Failed to reload firewall changes for #{@resource[:service]} : #{output}" unless $?.success?
  end

  def query_service
    result = firewall_cmd('--query-service', @resource[:service])
    if result == 'yes'
      true
    else
      false
    end
  end

  def exists?
    query_service
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
