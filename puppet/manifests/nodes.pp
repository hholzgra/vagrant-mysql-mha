node "host1.example.org" {
  include hanode

  file { "/etc/mysql/conf.d/server-id.cnf":
    content => "[mysqld]\nserver-id= 1\nlog-bin",
    ensure  => "present",
    owner   => "mysql",
    group   => "mysql", 
    notify  => Service["mysql"],
  }

  exec { "replication-user":
    command => "/usr/bin/mysql -u root -e \"GRANT REPLICATION SLAVE ON *.* TO 'repl'@'%';\"",
    unless => "/usr/bin/mysql -u root -e\"SELECT User from mysql.user WHERE User='repl';\" | /bin/grep -q repl",
    require => [Service[mysql], Package[mysql-client]],
  }  
}

node "host2.example.org" {
  include hanode

  file { "/etc/mysql/conf.d/server-id.cnf":
    content => "[mysqld]\nserver-id= 2",
    ensure  => "present",
    owner   => "mysql",
    group   => "mysql", 
    notify  => Service["mysql"],
  }
}

node "host3.example.org" {
  include hanode

  file { "/etc/mysql/conf.d/server-id.cnf":
    content => "[mysqld]\nserver-id= 3",
    ensure  => "present",
    owner   => "mysql",
    group   => "mysql", 
    notify  => Service["mysql"],
  }
}

node "host4.example.org" {
  include hanode
  include hamanager
}

