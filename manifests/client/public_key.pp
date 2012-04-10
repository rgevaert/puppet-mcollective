define mcollective::client::public_key($source, $ensure='present')
{
  file {
    "/etc/mcollective/ssl/${name}-public.pem":
      ensure => $ensure,
      source => $source,
      mode   => '0700',
      owner  => 'root',
      group  => 'root';
  }
}
