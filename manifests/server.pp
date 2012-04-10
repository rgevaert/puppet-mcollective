# setup the class for the "server" element - this is
# required on all systems that you wish to monitor/control
class mcollective::server (
    $stomp_host, $stomp_password, $stomp_user,
    $ensure               = 'running',
    $securityprovider     = 'psk',
    $plugin_psk           = '',
    $aes_send_pubkey      = 0,
    $aes_learn_pubkeys    = 0,
    $aes_client_cert_dir  = '/etc/mcollective/ssl/clients',
    $aes_server_private   = '/etc/mcollective/ssl/server-private.pem',
    $aes_server_public    = '/etc/mcollective/ssl/server-public.pem',
    $factsource           = 'yaml'
) inherits mcollective::params {

  include mcollective::common

  class {'mcollective::server::install':
        ensure => $ensure;} ~>
    class {'mcollective::server::conf':;}
    class {'mcollective::server::service':
        ensure => $ensure;}
}
