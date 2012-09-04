import "classes/*"
import "nodes.pp"


Exec["apt-get-update"] -> Package <| |>
exec { "apt-get-update" :
    command => "/usr/bin/apt-get update",
#    require => File["/etc/apt/apt.conf.d/02proxy"],
}
#file { "/etc/apt/apt.conf.d/02proxy":
#    ensure => "file",
#    source => "/vagrant/puppet/files/apt/02proxy",
#    owner  => "root",
#}


file { "/root/.ssh":
  ensure => directory,
  mode => 600,
  owner => "root",
}
file { "/root/.ssh/id_rsa":
  require => File["/root/.ssh"],
  source => "/vagrant/puppet/files/ssh/vagrant",
  mode => 600,
  owner => "root",
}
file { "/root/.ssh/id_rsa.pub":
  require => File["/root/.ssh"],
  source => "/vagrant/puppet/files/ssh/vagrant.pub",
  mode => 644,
  owner => "root",
}
file { "/root/.ssh/authorized_keys":
  require => File["/root/.ssh"],
  source => "/vagrant/puppet/files/ssh/vagrant.pub",
  mode => 600,
  owner => "root",
}
file { "/root/.ssh/known_hosts":
  require => File["/root/.ssh"],
  source => "/vagrant/puppet/files/ssh/known_hosts",
  mode => 644,
  owner => "root",
}



