class hamanager {
  package { ["libconfig-tiny-perl","liblog-dispatch-perl","libparallel-forkmanager-perl"]:
    ensure => present,
  }


  package { "mha4mysql-manager":
    require => Package["libdbd-mysql-perl","libconfig-tiny-perl","liblog-dispatch-perl","libparallel-forkmanager-perl"],
    ensure => present,
    provider => dpkg,
    source => "/vagrant/puppet/files/packages/mha4mysql-manager_0.52_all.deb",
  }
}


