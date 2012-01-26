class mcollective::params
{
  $sharepath = $operatingsystem ? {
    'Solaris'  => '/opt/csw/share/mcollective',
    default    => '/usr/share/mcollective',
  }


  $plugin_path = "${sharepath}/plugins"

  $config_path= $operatingsystem ? {
    'Solaris' => '/etc/opt/csw/mcollective',
    default   => '/etc/mcollective',
  }

  $site_plugin_path = "${config_path}/plugin.d"

  $package_common = $operatingsystem ? {
    'Solaris' => undef,
    default   => 'mcollective-common',
  }

  $package_server = $operatingsystem ? {
    default   => 'mcollective',
  }

  $package_client = $operatingsystem ? {
    'Solaris' => 'mcollective',
    default   => 'mcollective-client',
  }

  $stomppkg = $operatingsystem ? {
    'RedHat'  => "rubygem-stomp.noarch",
    'CentOs'  => "rubygem-stomp.noarch",
    default   => "ruby-stomp",
  }

  $pkg_provider = $operatingsystem ? {
    'Solaris' => pkgutil,
    'RedHat'  => yum,
    'CentOs'  => yum,
    default   => apt,
  }

  $mcollectived = $operatingsystem ? {
    'Solaris' => 'cswmcollectived',
    default   => 'mcollective'
  }

}
