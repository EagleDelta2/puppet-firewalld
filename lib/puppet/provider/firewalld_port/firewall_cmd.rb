Puppet::Type.type(:firewalld_port).provide('firewall_cmd') do
  commands :firewall_cmd => '/usr/bin/firewall-cmd'

  @rule="#{resource[:port]}/#{resource[:protocol]}"

  def firewalld_reload
    cmd = %x{`/usr/bin/firewall-cmd --reload`}
    raise Puppet::Error, "Failed to reload firewall changes for #{@resource[:service]} : #{cmd}" unless $?.success?
  end

  def exists?
    result = firewall_cmd('--query-port', @rule)
    if result == 'yes'
      true
    else
      false
    end
  end

  def create
    firewall_cmd('--permanent','--add-port', @rule)
    firewalld_reload
  end

  def destroy
    firewall_cmd('--permanent','--remove-port', @rule)
    firewalld_reload
  end
end
