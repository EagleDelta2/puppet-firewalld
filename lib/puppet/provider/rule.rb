Puppet::Type.type(:rule).provide(:rule) do
  desc "Placeholder doces"
  
  commands :firewall => "/usr/bin/firewall-cmd"
  
end