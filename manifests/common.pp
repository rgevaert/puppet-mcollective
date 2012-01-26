#### Puppet module for MCollective ###
class mcollective::common {

  include mcollective::params

  file {
    $mcollective::params::config_path:
      ensure  => directory,
      owner   => 'root',
      mode    => 0644;
    $mcollective::params::site_plugin_path_root:
      ensure => directory,
      owner => 'root',
      mode => 0644;
    $mcollective::params::site_plugin_path:
      ensure => directory,
      owner => 'root',
      mode => 0644;
  }

  if $operatingsystem != "Solaris"
  {
    package {
      $mcollective::params::package_common:
        ensure   => present,
        provider => $mcollective::params::pkg_provider;
      $mcollective::params::stomppkg:
        ensure   => present,
        provider => $mcollective::params::pkg_provider;
    }
  }
}
