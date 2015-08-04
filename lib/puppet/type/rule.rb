require 'puppet/parameter/boolean'

Puppet::Type.newtype(:rule) do
  @doc = %q{Manages firewalld basic rules}
  
  ensurable do
    defaultvalues
    defaultto :present
  end
  
  newparam(:name, :namevar => true) do
    desc "Rule name"
    munge do |value|
      value.downcase
    end
  end
  
  newparam(:permanent, :boolean => true, :parent => Puppet::Parameter::Boolean) do
    desc "Will the rule persist firewall stops?"
  end
  
  newproperty(:port) do
    validate do |value|
      unless value.to_i
        raise ArgumentError, "#{value} is not a valid port number"
      end
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