# == Class: blcr::install
#
# Private class
#
class blcr::install {

  package { 'blcr-modules':
    ensure  => $blcr::package_ensure,
    name    => $blcr::modules_package_name,
    require => $blcr::package_require,
  }->
  package { 'blcr-libs':
    ensure  => $blcr::package_ensure,
    name    => $blcr::libs_package_name,
    require => $blcr::package_require,
  }->
  package { 'blcr':
    ensure  => $blcr::package_ensure,
    name    => $blcr::package_name,
    require => $blcr::package_require,
  }

  if $blcr::install_dev {
    package { 'blcr-devel':
      ensure  => $blcr::package_ensure,
      name    => $blcr::dev_package_name,
      require => $blcr::dev_package_require,
    }
  }

  if $blcr::install_testsuite {
    package { 'blcr-testsuite':
      ensure  => $blcr::package_ensure,
      name    => $blcr::testsuite_package_name,
      require => $blcr::testsuite_package_require,
    }
  }

}
