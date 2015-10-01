# A web server talking to a database
define web(
  $database = undef,
  $dbuser = undef,
  $dbpassword = undef,
  $dbhost = undef,
  $port = 80)
{
  $txt = @("EOS")
Web server ${name} on ${::fqdn}:
  connect to ${dbuser}:${dbpassword}@${dbhost}/${database}

uptime: ${uptime_seconds}
EOS

  file { "/root/${name}.txt": content => $txt }
}
