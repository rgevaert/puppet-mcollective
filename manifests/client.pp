class mcollective::client (
    $stomp_host, $stomp_password, $stomp_user,
    $identity,
    $securityprovider   = 'psk',
    $plugin_psk          = '',
    $aes_send_pubkey     = 0,
    $aes_learn_pubkeys   = 0,
    $aes_client_private  = '/etc/mcollective/ssl/client-private.pem',
    $aes_client_public   = '/etc/mcollective/ssl/client-public.pem',
    $factsource          = 'yaml'
  ) inherits mcollective::params
{

  # No solaris support yet!

  include mcollective::common

  class{'mcollective::client::install':;}
    ~> class{'mcollective::client::conf':;}
}
