application webapp($dbpassword = 'secret', $webs) {
  $dbname = "${name}_db"

  db { $dbname:
    user => 'jessie',
    password => $dbpassword,
    export => Sql[$dbname]
  }

  $webs.each |$web| {
    web { "${name}_${web}":
      consume => Sql[$dbname],
    }
  }
}
