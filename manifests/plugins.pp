class mcollective::plugins {

  require mcollective::server

  include mcollective::params
  include mcollective::plugins::install
  
  Class['mcollective::params'] -> Class['mcollective::plugins::install']
  Class['mcollective::plugins::install'] ~> Class['mcollective::server::service']

}
