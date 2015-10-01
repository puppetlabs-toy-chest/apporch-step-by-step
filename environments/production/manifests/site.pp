## site.pp ##

node agent1 {
  db { pao_db:
    user => jessie,
    password => secret
  }
}

node agent2 {
  web { pao_w1:
    database => pao_db,
    dbuser => jessie,
    dbpassword => secret,
    dbhost => agent1,
  }
}

node default {
  file { "/root/default.txt":
    content => "Every node gets this\n"
  }
}
