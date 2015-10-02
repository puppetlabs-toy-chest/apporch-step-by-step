application webapp {
  $dbname = "${name}_db"

  db { $dbname:
    user => 'jessie',
    password => 'secret',
    export => Sql[$dbname]
  }

  web { "${name}_w1":
    consume => Sql[$dbname],
  }
}
