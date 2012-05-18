class mcollective::params
{
  # Parameters that can be overriden.

  # server parameters:
  $ensure              = 'running'
  $factsource          = 'yaml'
  $aes_client_cert_dir = '/etc/mcollective/ssl/clients'
  $aes_server_private  = '/etc/mcollective/ssl/server-private.pem'
  $aes_server_public   = '/etc/mcollective/ssl/server-public.pem'

  # client parameters:
  $aes_client_private  = '/etc/mcollective/ssl/client-private.pem'
  $aes_client_public   = '/etc/mcollective/ssl/client-public.pem'

  # server and client parameters:
  $securityprovider    = 'psk'
  $plugin_psk          = ''
  $aes_send_pubkey     = 0
  $aes_learn_pubkeys   = 0


  # Parameters that can't be overriden.

  $sharepath = $::operatingsystem ? {
    'Solaris'                       => '/opt/csw/share/mcollective',
    /(?i:CentOS|RedHat|Scientific)/ => '/usr/libexec',
    default                         => '/usr/share/mcollective',
  }

  $plugin_path = $::operatingsystem ? {
    /(?i:CentOS|RedHat|Scientific)/ => "${sharepath}/mcollective",
    default                         => "${sharepath}/plugins",
  }

  $config_path= $::operatingsystem ? {
    'Solaris' => '/etc/opt/csw/mcollective',
    default   => '/etc/mcollective',
  }

  $site_plugin_path_root = "${config_path}/plugin.d"
  $site_plugin_path = "${site_plugin_path_root}/mcollective"

  $package_common = $::operatingsystem ? {
    'Solaris' => undef,
    default   => 'mcollective-common',
  }

  $package_server = $::operatingsystem ? {
    default   => 'mcollective',
  }

  $package_client = $::operatingsystem ? {
    'Solaris' => 'mcollective',
    default   => 'mcollective-client',
  }

  $stomp_port = 6163

  $stomppkg = $::operatingsystem ? {
    'RedHat'  => 'rubygem-stomp.noarch',
    'CentOs'  => 'rubygem-stomp.noarch',
    default   => 'ruby-stomp',
  }

  $pkg_provider = $::operatingsystem ? {
    'Solaris' => pkgutil,
    'RedHat'  => yum,
    'CentOs'  => yum,
    default   => apt,
  }

  $mcollectived = $::operatingsystem ? {
    'Solaris' => 'cswmcollectived',
    default   => 'mcollective'
  }

}
