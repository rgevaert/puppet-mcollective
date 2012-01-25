class mcollective::client($stomp_host, $stomp_password, $stomp_user, $plugin_psk, $identity)
{

  # No solaris support yet!

  include mcollective::common
  include mcollective::params
  include mcollective::client::install
  include mcollective::client::conf
  
  Class['mcollective::common']
    ->  Class['mcollective::params']
    -> Class['mcollective::client::install']
    -> Class['mcollective::client::conf']
}
