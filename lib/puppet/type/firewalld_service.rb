Puppet::Type.newtype(:firewalld_service) do
  @doc = %q{Manages firewalld service-based rules}

  ensurable do
    defaultvalues
    defaultto :present
  end

  newparam(:name, :namevar => true) do
    desc "Service name"
  end

  newparam(:service) do
    desc "Service"
  end
end
