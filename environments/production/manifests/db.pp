# Set up a database for the given user/password
define db($database = $name, $user = 'jessie', $password = undef)
{
  $txt = @("EOS")
Database ${name} on ${::fqdn}:
  creating a database ${database} for ${user} with password ${password}

uptime: ${uptime_seconds}
EOS

  file { "/root/${name}.txt": content => $txt }
}

Db produces Sql {
  user => $user,
  password => $password,
  host => $::fqdn,
  port => 5432,
  database => $database
}
