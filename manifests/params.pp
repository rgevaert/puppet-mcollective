class mcollective::params
{
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
