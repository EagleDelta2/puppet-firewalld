Puppet::Type.type(:firewall_rule).provide(:ruby) do
  desc "Placeholder docs"
  
  commands :firewall => "/usr/bin/firewall-cmd"
  
  def create
    if resource[:port]
      add_port_rule
    elsif resource[:service]
      add_service_rule
    else
      raise Puppet::Error, "Invalid rule"
    end
  end
  private
  
  def add_port_rule()
    
  end
  
  
end