class mcollective::plugins (
  $site_plugin_path = $mcollective::params::site_plugin_path
) inherits mcollective::params {

  require mcollective::server

  include mcollective::plugins::install

  Class['mcollective::plugins::install'] ~>
    Class['mcollective::server']

}
