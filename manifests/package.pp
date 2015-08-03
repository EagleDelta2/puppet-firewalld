class firewalld::package {
  package { 'firewalld':
    ensure => installed
  }
}