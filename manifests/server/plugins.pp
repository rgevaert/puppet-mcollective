class mcollective::server::plugins
{
  $plugins = [ 'mcollective-facter-facts',
                'mcollective-package-agent',
                'mcollective-nrpe-agent',
                'mcollective-puppet-agent',
                'mcollective-service-agent',
                'mcollective-filemgr-agent',
             ]

  mcollective::plugin{
    $plugins:;
  }
}
