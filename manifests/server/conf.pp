# setup the class for the "server" element - this is
# required on all systems that you wish to monitor/control
class mcollective::server::conf {

  $plugin_path=$mcollective::params::plugin_path
  $site_plugin_path_root=$mcollective::params::site_plugin_path_root
  file {
    'mcollective-server.cfg':
      content => template('mcollective/server.cfg.erb'),
      owner   => 'root',
      group   => 'root',
      mode    => '0440',
      path    => "${mcollective::params::config_path}/server.cfg",
  }
}
