class mcollective::client::plugins
{
  $plugins =  [ 'mcollective-package-client',
                'mcollective-filemgr-client',
                'mcollective-nrpe-client',
                'mcollective-puppet-client',
                'mcollective-service-client',
              ]

  mcollective::plugin{
    $plugins:;
  }
}
