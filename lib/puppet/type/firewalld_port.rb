Puppet::Type.newtype(:firewalld_port) do
  @doc = %q{Manages firewalld basic rules}
  
  ensurable do
    defaultvalues
    defaultto :present
  end
  
  newparam(:name, :namevar => true) do
    desc "Rule name"
  end
  
  newparam(:port) do
    validate do |value|
      Integer(value)
    end
  end
  
  newparam(:protocol) do
    newvalues(:tcp, :udp)
    validate do |value|
      unless value =~ /^tcp|udp/
        raise ArgumentError, "#{value} is not a valid network protocol"
      end
    end
  end
  
end
