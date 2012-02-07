define mcollective::client::private_key($source, $ensure="present")
{
  file {
    "/etc/mcollective/ssl/${name}-private.pem":
      ensure => $ensure,
      source => $source,
      mode   => 700,
      owner  => root,
      group  => root;
  }
}
