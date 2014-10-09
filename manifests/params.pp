# == Class: blcr::params
#
# Private class
#
class blcr::params {

  $package_require      = undef
  $package_ensure       = 'present'
  $install_dev          = true
  $install_testsuite    = false
  $service_autorestart  = true
  $service_ensure       = 'running'
  $service_enable       = true

  case $::osfamily {
    'RedHat': {
      $package_name           = 'blcr'
      $modules_kernel         = regsubst($::kernelrelease, '-', '_')
      $modules_package_name   = "blcr-modules_${modules_kernel}"
      $libs_package_name      = 'blcr-libs'
      $dev_package_name       = 'blcr-devel'
      $testsuite_package_name = 'blcr-testsuite'
      $service_name           = 'blcr'
      $service_hasstatus      = true
      $service_hasrestart     = true
    }

    default: {
      fail("Unsupported osfamily: ${::osfamily}, module ${module_name} only support osfamily RedHat")
    }
  }

}
