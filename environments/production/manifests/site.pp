## site.pp ##

node default {
  file { "/root/default.txt": content => "Every node gets this\n" }
}
