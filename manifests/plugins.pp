class mcollective::plugins inherits mcollective::params {

  require mcollective::server

  include mcollective::plugins::install

  Class['mcollective::plugins::install'] ~>
    Class['mcollective::server']

}
