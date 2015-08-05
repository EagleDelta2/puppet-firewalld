Puppet::Type.newtype(:firewall_rule) do
  @doc = %q{Manages firewalld basic rules}
  
  ensurable do
    defaultvalues
    defaultto :present
  end
  
  newparam(:name, :namevar => true) do
    desc "Rule name"
  end
  
  newparam(:permanent) do
    desc "Will the rule persist firewall stops?"
    newvalue(true, false)
  end
  
  newproperty(:port) do
    validate do |value|
      Integer(value)
    end
  end
  
  newproperty(:service) do
    validate do |value|
      unless value =~ /^\w+/
        raise ArgumentError, "#{value} is not a valid service name"
      end
    end
  end
  
  newproperty(:protocol) do
    newvalue(:tcp, :udp)
    validate do |value|
      unless value =~ /^tcp|udp/
        raise ArgumentError, "#{value} is not a valid network protocol"
      end
    end
  end
  
end