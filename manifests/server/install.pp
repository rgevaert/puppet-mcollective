class mcollective::server::install($ensure) {
  file {
    $mcollective::params::sharepath:
      ensure  => directory,
      owner   => 'root',
      mode    => '0644';
    $mcollective::params::plugin_path:
      ensure  => directory,
      owner   => 'root',
      mode    => '0644';
  #"${mcollective::params::sharepath}/mcollective":
  # ensure => directory,
  # owner  => 'root',
  # mode   => '0644';
  }

  if $::operatingsystem == 'Debian'
  {
    $e = $ensure ? {
      'running' => 'yes',
      default   => 'no',
    }

    file {
      '/etc/default/mcollective':
        content => inline_template("# Managed with Puppet\nRUN=<%= e %>\n");
    }
  }

  package {
    'mcollective':
      ensure    => present,
      name      => $mcollective::params::package_server,
      provider  => $mcollective::params::pkg_provider;
  }
}
