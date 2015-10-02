## site.pp ##

site {
  webapp { pao:
    dbpassword => 'sikrit',
    webs  => ['w1', 'w2', 'w3'],
    nodes => {
      Node[agent1] => Db[pao_db],
      Node[agent2] => [ Web[pao_w1], Web[pao_w2], Web[pao_w3] ]
    }
  }
}

node default {
  file { "/root/default.txt":
    content => "Every node gets this\n"
  }
}
