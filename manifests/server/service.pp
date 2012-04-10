# setup the class for the "server" element -
# this is required on all systems that you wish to monitor/control
class mcollective::server::service ($ensure) {
  service {
    'mcollective':
      ensure      => $ensure,
      name        => $mcollective::params::mcollectived,
      hasrestart  => true,
      hasstatus   => false;
  }
}
