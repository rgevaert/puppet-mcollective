define mcollective::server::client_key(
  $source,
  $ensure='present',
  $client_cert_dir = '/etc/mcollective/ssl/clients')
{
  file {
    "${client_cert_dir}/${name}-public.pem":
      ensure => $ensure,
      source => $source,
      notify => Class['mcollective::server'],
      mode   => '0700',
      owner  => 'root',
      group  => 'root';
  }
}
