class hanode {
  package { ["mysql-server", "mysql-client", "libdbd-mysql-perl"]:
    ensure => present,
  }

  package { "mha4mysql-node":
    require => Package["libdbd-mysql-perl"],
    ensure => present,
    provider => dpkg,
    source => "/vagrant/packages/mha4mysql-node_0.52_all.deb",
  }
}

