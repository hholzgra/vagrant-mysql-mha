import "classes/*"
import "nodes.pp"

file { "/root/.ssh":
  ensure => directory,
  mode => 600,
  owner => "root",
}
file { "/root/.ssh/id_rsa":
  require => File["/root/.ssh"],
  source => "/vagrant/ssh/vagrant",
  mode => 600,
  owner => "root",
}
file { "/root/.ssh/id_rsa.pub":
  require => File["/root/.ssh"],
  source => "/vagrant/ssh/vagrant.pub",
  mode => 644,
  owner => "root",
}
file { "/root/.ssh/authorized_keys":
  require => File["/root/.ssh"],
  source => "/vagrant/ssh/vagrant.pub",
  mode => 600,
  owner => "root",
}
file { "/root/.ssh/known_hosts":
  require => File["/root/.ssh"],
  source => "/vagrant/ssh/known_hosts",
  mode => 644,
  owner => "root",
}



