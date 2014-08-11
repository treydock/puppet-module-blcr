# == Class: blcr
#
# See README.md for more details.
#
class blcr (
  $package_require      = $::blcr::params::package_require,
  $package_ensure       = $::blcr::params::package_ensure,
  $package_name         = $::blcr::params::package_name,
  $install_dev          = $::blcr::params::install_dev,
  $dev_package_name     = $::blcr::params::dev_package_name,
  $modules_package_name = $::blcr::params::modules_package_name,
  $service_name         = $::blcr::params::service_name,
  $service_ensure       = $::blcr::params::service_ensure,
  $service_enable       = $::blcr::params::service_enable,
  $service_hasstatus    = $::blcr::params::service_hasstatus,
  $service_hasrestart   = $::blcr::params::service_hasrestart,
) inherits blcr::params {

  validate_bool($install_dev)

  anchor { 'blcr::start': }->
  class { '::blcr::install': }~>
  class { '::blcr::service': }->
  anchor { 'blcr::end': }

}
