# setup the class for the "server" element - this is
# required on all systems that you wish to monitor/control
class mcollective::server (
    $stomp_host, $stomp_password, $stomp_user,
    $ensure               = $mcollective::params::ensure,
    $connector            = $mcollective::params::connector,
    $stomp_port           = $mcollective::params::stomp_port,
    $securityprovider     = $mcollective::params::securityprovider,
    $plugin_psk           = $mcollective::params::plugin_psk,
    $aes_send_pubkey      = $mcollective::params::aes_send_pubkey,
    $aes_learn_pubkeys    = $mcollective::params::aes_learn_pubkeys,
    $aes_client_cert_dir  = $mcollective::params::aes_client_cert_dir,
    $aes_server_private   = $mcollective::params::aes_server_private,
    $aes_server_public    = $mcollective::params::aes_server_public,
    $factsource           = $mcollective::params::factsource
) inherits mcollective::params {

  include mcollective::common

  class {'mcollective::server::install':
        ensure => $ensure;} ~>
    class {'mcollective::server::conf':;}
    class {'mcollective::server::service':
        ensure => $ensure;}
}
