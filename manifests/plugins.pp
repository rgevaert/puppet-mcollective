class mcollective::plugins inherits mcollective::params {

  require mcollective::server

  class{'mcollective::plugins::install':;} ~>
    class{'mcollective::server::service':;}

}
