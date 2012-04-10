class mcollective::client::install
{

#  file {"/usr/share/mcollective/bin/":
#         source => "puppet:///modules/mcollective/scripts",
#         ensure => directory,
#         recurse => true,
#         owner => 'root',
#         mode => 0755,
#         require => [File["$config_path"],Package["mcollective-client"]],
#  }

  # install the package
  package {
    $mcollective::params::package_client:
      ensure => present,
#     require  => File['/usr/share/mcollective/bin/'],
      provider => $mcollective::params::pkg_provider;
  }

}
