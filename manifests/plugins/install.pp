class mcollective::plugins::install {

  file {
    'site_agents':
      ensure  => directory,
      path    => "${mcollective::plugins::site_plugin_path}/agent/",
      source  => 'puppet:///modules/mcollective/agent',
      recurse => true,
      owner   => 'root',
      mode    => '0644';
    'site_facts':
      ensure  => directory,
      path    => "${mcollective::plugins::site_plugin_path}/facts/",
      source  => 'puppet:///modules/mcollective/facts',
      recurse => true,
      owner   => 'root',
      mode    => '0644';
    'site_application':
      ensure  => directory,
      path    => "${mcollective::plugins::site_plugin_path}/application/",
      source  => 'puppet:///modules/mcollective/application',
      recurse => true,
      owner   => 'root',
      mode    => '0644';
  }
}
