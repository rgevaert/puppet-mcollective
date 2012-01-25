# setup the class for the "server" element - this is required on all systems that you wish to monitor/control
class mcollective::server ($ensure="running", $stomp_host, $stomp_password, $stomp_user, $plugin_psk)  {

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
