class hamanager {
  package { ["libconfig-tiny-perl","liblog-dispatch-perl","libparallel-forkmanager-perl"]:
    ensure => present,
  }

  package { "mha4mysql-manager":
    require => [Exec["download-manager-package"], Package["libdbd-mysql-perl","libconfig-tiny-perl","liblog-dispatch-perl","libparallel-forkmanager-perl","mha4mysql-node"]],
    ensure => present,
    provider => dpkg,
    source => "/vagrant/puppet/files/packages/mha4mysql-manager_0.52_all.deb",
  }

  exec { "download-manager-package":
    command => "/vagrant/puppet/files/packages/download-packages.sh",
    user    => "root",
    cwd     => "/vagrant/puppet/files/packages",
    creates => "/vagrant/puppet/files/packages/mha4mysql-manager_0.52_all.deb",
  }
}


