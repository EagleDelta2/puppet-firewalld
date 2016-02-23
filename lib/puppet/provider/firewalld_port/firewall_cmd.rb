Puppet::Type.type(:firewalld_port).provide('firewall_cmd') do
  commands :firewall_cmd => '/usr/bin/firewall-cmd'

  def firewalld_reload
    cmd = %x{`/usr/bin/firewall-cmd --reload`}
    raise Puppet::Error, "Failed to reload firewall changes for #{@resource[:service]} : #{cmd}" unless $?.success?
  end

  def exists?
    firewall_cmd('--list-ports').split(' ').include?("#{resource[:port]}/#{resource[:protocol]}")
  end

  def create
    rule="#{resource[:port]}/#{resource[:protocol]}"
    firewall_cmd('--permanent','--add-port', rule)
    firewalld_reload
  end

  def destroy
    rule="#{resource[:port]}/#{resource[:protocol]}"
    firewall_cmd('--permanent','--remove-port', rule)
    firewalld_reload
  end
end
