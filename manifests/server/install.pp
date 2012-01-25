class mcollective::server::install($ensure) {
  file {
    $mcollective::params::sharepath:
      ensure => directory,
      owner => 'root',
      mode => 0644;
    $mcollective::params::plugin_path:
      ensure => directory,
      owner => 'root',
      mode => 0644;
    "${mcollective::params::sharepath}/mcollective":
      ensure => directory,
      owner => 'root',
      mode => 0644;
#    "agents":
#      source => "puppet:///modules/mcollective/agent",
#      ensure => directory,
#      recurse => true,
#      owner => 'root',
#      mode => 0644,
#      path => "${mcollective::params::plugin_path}/mcollective/agent/";
#    "facts":
#      source => "puppet:///modules/mcollective/facts",
#      ensure => directory,
#      recurse => true,
#      owner => 'root',
#      mode => 0644,
#      path => "${mcollective::params::plugin_path}/mcollective/facts/";
  }

  if $operatingsystem == "Debian"
  {
    file {
      '/etc/default/mcollective':
        content => $ensure ? {
          'running' => "# Change to yes, to enable Mcollective on boot\nRUN=yes\n",
          default   => "# Change to yes, to enable Mcollective on boot\nRUN=no\n",
        };
    }
  }

  package {
    "mcollective":
      name => $mcollective::params::package_server,
      provider => $mcollective::params::pkg_provider,
      ensure => present;
  }
}
