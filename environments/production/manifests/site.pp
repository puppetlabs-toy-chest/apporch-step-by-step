## site.pp ##

node agent1 {
  db { pao_db:
    user => jessie,
    password => secret,
    export => Sql[pao_db]
  }
}

node agent2 {
  web { pao_w1:
    consume => Sql[pao_db]
  }
}

node default {
  file { "/root/default.txt":
    content => "Every node gets this\n"
  }
}
