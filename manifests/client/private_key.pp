define mcollective::client::private_key($source, $ensure='present')
{
  file {
    "/etc/mcollective/ssl/${name}-private.pem":
      ensure => $ensure,
      source => $source,
      mode   => '0700',
      owner  => 'root',
      group  => 'root';
  }
}
