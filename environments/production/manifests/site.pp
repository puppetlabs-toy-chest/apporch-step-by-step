## site.pp ##

site {
  webapp { pao:
    nodes => {
      Node[agent1] => Db[pao_db],
      Node[agent2] => Web[pao_w1]
    }
  }
}

node default {
  file { "/root/default.txt":
    content => "Every node gets this\n"
  }
}
