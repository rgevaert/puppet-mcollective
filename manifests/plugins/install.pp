class mcollective::plugins::install {

  $spp = $mcollective::params::site_plugin_path

  file {
    'site_agents':
      ensure  => directory,
      source  => 'puppet:///modules/mcollective/agent',
      recurse => true,
      owner   => 'root',
      mode    => '0644',
      path    => "${spp}/agent/";
    'site_facts':
      ensure  => directory,
      source  => 'puppet:///modules/mcollective/facts',
      recurse => true,
      owner   => 'root',
      mode    => '0644',
      path    => "${spp}/facts/";
    'site_application':
      ensure  => directory,
      source  => 'puppet:///modules/mcollective/application',
      recurse => true,
      owner   => 'root',
      mode    => '0644',
      path    => "${spp}/application/";
  }
}
