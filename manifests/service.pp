# == Class: blcr::service
#
# Private class
#
class blcr::service {

  service { 'blcr':
    ensure     => $blcr::service_ensure,
    enable     => $blcr::service_enable,
    name       => $blcr::service_name,
    hasstatus  => $blcr::service_hasstatus,
    hasrestart => $blcr::service_hasrestart,
  }

}
