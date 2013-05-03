define mcollective::plugin (
  $ensure = 'installed'
) {

  package {
    $name:
      ensure => $ensure;
  }
  
}
