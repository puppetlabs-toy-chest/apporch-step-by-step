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
      export  => Http["${name}_${web}"]
    }
  }

  $members = $webs.map |$web| { Http["${name}_${web}"] }
  lb { "${name}_lb":
    members => $members,
    require => $members
  }
}
