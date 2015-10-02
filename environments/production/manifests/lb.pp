# A load balancer with the given members
define lb($members = undef)
{
  $txt = inline_epp(@(EOT))
Load balancer <%= $name %> on <%= $::fqdn %>:
<%-   $members.each |$http| { -%>
  <%= "${http[scheme]}:://${http[host]}:${http[port]}/" %>
<%- } %>
EOT

  file { "/root/${name}.txt": content => $txt }
}
