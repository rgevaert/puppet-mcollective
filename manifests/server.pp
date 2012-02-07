# setup the class for the "server" element - this is required on all systems that you wish to monitor/control
class mcollective::server (
    $ensure="running",
    $stomp_host, $stomp_password, $stomp_user,
    $securityprovider   = 'psk',
    $plugin_psk          = '',
    $aes_send_pubkey     = 0,
    $aes_learn_pubkeys   = 0,
    $aes_client_cert_dir = '/etc/mcollective/ssl/clients',
    $aes_server_private  = '/etc/mcollective/ssl/server-private.pem',
    $aes_server_public   = '/etc/mcollective/ssl/server-public.pem',
    $factsource          = 'yaml')
{

  class {
    'mcollective::common':;
    'mcollective::server::install':
      ensure => $ensure;
    'mcollective::server::conf':;
    'mcollective::server::service':
      ensure => $ensure;
  }
  
  Class['mcollective::common']
    -> Class['mcollective::params']
    -> Class['mcollective::server::install']
    -> Class['mcollective::server::conf']
    -> Class['mcollective::server::service']

  Class['mcollective::server::conf']
    ~> Class['mcollective::server::service']
}
