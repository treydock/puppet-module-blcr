# == Class: blcr
#
# See README.md for more details.
#
class blcr (
  $package_require        = $blcr::params::package_require,
  $package_ensure         = $blcr::params::package_ensure,
  $package_name           = $blcr::params::package_name,
  $modules_package_ensure = $blcr::params::modules_package_ensure,
  $modules_package_name   = $blcr::params::modules_package_name,
  $libs_package_name      = $blcr::params::libs_package_name,
  $install_dev            = $blcr::params::install_dev,
  $dev_package_name       = $blcr::params::dev_package_name,
  $install_testsuite      = $blcr::params::install_testsuite,
  $testsuite_package_name = $blcr::params::testsuite_package_name,
  $service_name           = $blcr::params::service_name,
  $service_ensure         = $blcr::params::service_ensure,
  $service_enable         = $blcr::params::service_enable,
  $service_autorestart    = $blcr::params::service_autorestart,
  $service_hasstatus      = $blcr::params::service_hasstatus,
  $service_hasrestart     = $blcr::params::service_hasrestart,
) inherits blcr::params {

  validate_bool($install_dev, $install_testsuite, $service_autorestart)

  $dev_package_require  = $blcr::package_require ? {
    undef   => Package['blcr-libs'],
    default => [ Package['blcr-libs'], $blcr::package_require ],
  }

  $testsuite_package_require  = $blcr::package_require ? {
    undef   => Package['blcr'],
    default => [ Package['blcr'], $blcr::package_require ],
  }

  include blcr::install
  include blcr::service

  if $service_autorestart {
    anchor { 'blcr::start': }->
    Class['blcr::install']~>
    Class['blcr::service']->
    anchor { 'blcr::end': }
  } else {
    anchor { 'blcr::start': }->
    Class['blcr::install']->
    Class['blcr::service']->
    anchor { 'blcr::end': }
  }

}
