# setup the class for the "server" element - this is required on all systems that you wish to monitor/control
class mcollective::server::conf {

  $plugin_path=$mcollective::params::plugin_path 
  $site_plugin_path=$mcollective::params::site_plugin_path 
  file {
    "mcollective-server.cfg":
      content => template('mcollective/server.cfg.erb'),
      owner => "root",
      group => "root",
      mode => 440,
      path => "${mcollective::params::config_path}/server.cfg",
  }
}
