# == Class: firewalld::config
#
# This class configures the firewalld.conf file
#
# == Parameters
# 
# [*ensure*]
# This parameter is used to set the file resource
# ensure attribute. Please see puppet docs for valid
# values.
#
# [*default_zone*]
# The default firewall zone that firewalld will place
# new rules into.
#
# [*minimal_mark*]
# For some firewall settings several rules are needed 
# in different tables to be able to handle packets in
# the correct way. To achieve that these packets are 
# marked using the MARK target iptables(8) and ip6tables(8).
# With the MinimalMark option a block of marks can be reserved
# for private use; only marks over this value are used. (From man firewalld.conf)
# Default value is 100.
#
# [*exit_clean*]
# Configure firewalld to clean all firewall rules on a
# stopped service. Valid values are true or false.
# Default is true.
#
# [*lockdown*]
# Configure the D-Bus lockdown in firewalld. If enabled,
# firewall changes with the D-Bus interface will be limited
# to applications that are listed in the lockdown whitelist.
# See "man firewalld.lockdown-whitelist(5)" for more.
# Valid values are true or false, defaults to false.
#
# [*ipv6_filter*]
# Enable or disable reverse path filter test on a packet for
# IPv6. Valid values are true or false, default is true.
#
# [*config_file]
# Absolute path to the firewalld.conf file.
# Used as the path and name for the file resource.
# Default is /etc/firewalld/firewalld.conf
#
class firewalld::config(
  $ensure       = 'file',
  $default_zone = unset,
  $minimal_mark = '100',
  $exit_clean   = true,
  $lockdown     = false,
  $ipv6_filter  = true,
  $config_file  = '/etc/firewalld/firewalld.conf'
) {
  file { $config_file:
    ensure  => $ensure,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template('firewalld/firewalld.conf.erb')
  }
}