node "host1.example.org" {
  include hanode

  file { "/etc/mysql/conf.d/server-id.cnf":
    require => Package["mysql-server"],
    content => "[mysqld]\nserver-id= 1\nlog-bin\nbind=0.0.0.0",
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
    require => Package["mysql-server"],
    content => "[mysqld]\nserver-id= 2\nbind=0.0.0.0",
    ensure  => "present",
    owner   => "mysql",
    group   => "mysql", 
    notify  => Service["mysql"],
  }

  exec { "slave-setup":
    command => "/usr/bin/mysql -u root -e \"CHANGE MASTER TO master_user='repl', master_host='33.33.33.11'; START SLAVE;\"",
    unless => "/usr/bin/mysql -u root -e'SHOW SLAVE STATUS' | /bin/grep -q Master",
    require => [Service[mysql], Package[mysql-client]],
  }
}

node "host3.example.org" {
  include hanode

  file { "/etc/mysql/conf.d/server-id.cnf":
    require => Package["mysql-server"],
    content => "[mysqld]\nserver-id= 3\nbind=0.0.0.0",
    ensure  => "present",
    owner   => "mysql",
    group   => "mysql", 
    notify  => Service["mysql"],
  }

  exec { "slave-setup":
    command => "/usr/bin/mysql -u root -e \"CHANGE MASTER TO master_user='repl', master_host='33.33.33.11'; START SLAVE;\"",
    unless => "/usr/bin/mysql -u root -e'SHOW SLAVE STATUS' | /bin/grep -q Master",
    require => [Service[mysql], Package[mysql-client]],
  }
}

node "host4.example.org" {
  include hanode
  include hamanager
}

