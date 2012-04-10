class mcollective::client::conf
{
  $plugin_path=$mcollective::params::plugin_path
  $site_plugin_path_root=$mcollective::params::site_plugin_path_root

  # push the client cfg out to the nodes and subscribe to/require the package
  file {
    'mcollective-client.cfg':
      content => template('mcollective/client.cfg.erb'),
      path    => "${mcollective::params::config_path}/client.cfg",
      owner   => 'root',
      group   => 'root',
      mode    => '0440',
  }
}
