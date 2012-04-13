class mcollective::client (
    $stomp_host, $stomp_password, $stomp_user,
    $identity,
    $securityprovider    = $mcollective::params::securityprovider,
    $plugin_psk          = $mcollective::params::plugin_psk,
    $aes_send_pubkey     = $mcollective::params::aes_send_pubkey,
    $aes_learn_pubkeys   = $mcollective::params::aes_learn_pubkeys,
    $aes_client_private  = $mcollective::params::aes_client_private,
    $aes_client_public   = $mcollective::params::aes_client_public,
    $factsource          = $mcollective::params::factsource
  ) inherits mcollective::params
{

  # No solaris support yet!

  include mcollective::common

  class{'mcollective::client::install':;}
    ~> class{'mcollective::client::conf':;}
}
