class firewalld::service {
  service { 'firewalld':
    ensure     => running,
    enable     => true,
    hasstatus  => true,
    hasrestart => true
  }
}