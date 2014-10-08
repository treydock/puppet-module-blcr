# == Class: blcr::install
#
# Private class
#
class blcr::install {

  include ::blcr

  package { 'blcr':
    ensure  => $::blcr::package_ensure,
    name    => $::blcr::package_name,
    require => $::blcr::package_require,
  }

  if $::blcr::install_modules {
    package { 'blcr-modules':
      ensure  => $::blcr::package_ensure,
      name    => $::blcr::modules_package_name,
      require => $::blcr::package_require,
    }
  }

  if $::blcr::install_dev {
    package { 'blcr-devel':
      ensure  => $::blcr::package_ensure,
      name    => $::blcr::dev_package_name,
      require => $::blcr::package_require,
    }
  }

}
