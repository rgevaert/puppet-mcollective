class mcollective::server::plugins
{
  $plugins =  [ 'mcollective-facter-facts',
                'mcollective-package-agent',
                'mcollective-nrpe-agent',
                'mcollective-puppet-agent',
                'mcollective-service-agent',
                'mcollective-filemgr-agent',
              ]

  mcollective::plugin{
    $plugins:
  }


  file {
    'site_plugins/agent':
      ensure  => directory,
      source  => ["puppet:///modules/mcollective/${::lsbdistcodename}/agent",
                  'puppet:///modules/mcollective/default/agent'],
      recurse => true,
      owner   => 'root',
      mode    => '0644',
      path    => "${mcollective::params::site_plugin_path}/agent",
      notify  => Class[mcollective::server];
    'site_plugins/application':
      ensure  => directory,
      source  => ["puppet:///modules/mcollective/${::lsbdistcodename}/application",
                  'puppet:///modules/mcollective/default/application'],
      recurse => true,
      owner   => 'root',
      mode    => '0644',
      path    => "${mcollective::params::site_plugin_path}/application",
      notify  => Class[mcollective::server];
    'site_plugins/facts':
      ensure  => directory,
      source  => ["puppet:///modules/mcollective/${::lsbdistcodename}/facts",
                  'puppet:///modules/mcollective/default/facts'],
      recurse => true,
      owner   => 'root',
      mode    => '0644',
      path    => "${mcollective::params::site_plugin_path}/facts",
      notify  => Class[mcollective::server];
    }
}
