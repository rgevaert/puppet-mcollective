# setup the class for the "server" element - this is required on all systems that you wish to monitor/control
class mcollective::server::service ($ensure) {
  service {
    "mcollective":
      name        => $mcollective::params::mcollectived,
      ensure      => $ensure,
      hasrestart  => true,
      hasstatus   => false;
  }
}
