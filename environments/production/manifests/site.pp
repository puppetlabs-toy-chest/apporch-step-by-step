## site.pp ##

site {
  # This is the input - it tells us which and how many
  # web components we want and what nodes they should
  # go on. In serious use, this would probably live in
  # hiera or be pulled in from some other data source
  # (maybe a server-side function talking to some sort
  # of inventory system)
  $webnodes = {
    'w1' => 'agent2',
    'w2' => 'agent2',
    'w3' => 'agent2',
    'w4' => 'agent2',
    'w5' => 'agent2',
  }

  # This is all a bit ugly; we'd really want to hide
  # all this in a couple functions. All we need at the
  # end is a properly set up $nodes hash and $webs
  # array
  $fixed_nodes = {
    Node[agent1] => Db[pao_db],
    Node[agent3] => Lb[pao_lb],
    Node[agent2] => []
  }

  $nodes = $webnodes.reduce($fixed_nodes) | $memo, $pair | {
    [$web, $name] = $pair
    $key = Node["$name"]
    $memo + { $key => $memo[$key] + [ Web["pao_${web}"] ] }
  }

  $webs = $webnodes.reduce([]) | $memo, $pair | {
    $memo + $pair[0]
  }

  # Let's do it !
  webapp { pao:
    dbpassword => 'sikrit',
    webs  => $webs,
    nodes => $nodes
  }
}

node default {
  file { "/root/default.txt":
    content => "Every node gets this\n"
  }
}
