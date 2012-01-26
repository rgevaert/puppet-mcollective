class mcollective::plugins::install {

  $spp = $mcollective::params::site_plugin_path

  file {
    "site_agents":
      source => "puppet:///modules/mcollective/agent",
      ensure => directory,
      recurse => true,
      owner => 'root',
      mode => 0644,
      path => "${spp}/agent/";
    "site_facts":
      source => "puppet:///modules/mcollective/facts",
      ensure => directory,
      recurse => true,
      owner => 'root',
      mode => 0644,
      path => "${spp}/facts/";
  }
}
