# puppet-module-blcr

[![Build Status](https://travis-ci.org/treydock/puppet-module-blcr.png)](https://travis-ci.org/treydock/puppet-module-blcr)

####Table of Contents

1. [Overview](#overview)
2. [Usage - Configuration options](#usage)
3. [Reference - Parameter and detailed reference to all options](#reference)
4. [Limitations - OS compatibility, etc.](#limitations)
5. [Development - Guide for contributing to the module](#development)
6. [TODO](#todo)
7. [Additional Information](#additional-information)

## Overview

This module manages BLCR.

## Usage

### blcr

Install BLCR specifying your site's Yumrepo resource that contains the blcr RPMs.

    class { 'blcr':
      package_require => Yumrepo['example'],
    }

This is an example of using the blcr-dkms package instead of the blcr-modules package.

    class { 'blcr':
      package_require       => Yumrepo['example'],
      modules_package_name  => 'blcr-dkms',
    }

This is an example of using Hiera to set the version of BLCR for packages including blcr-modules

    blcr::modules_package_name: "blcr-modules_2.6.32-431.23.3.el6.x86_64-%{hiera('blcr::package_ensure')}.x86_64"
    blcr::package_ensure: "0.8.5-1.el6"
    blcr::package_require: 'Yumrepo[example]'

## Reference

### Classes

#### Public classes

* `blcr`: Installs and configures blcr.

#### Private classes

* `blcr::install`: Installs blcr packages.
* `blcr::service`: Manages the blcr service.
* `blcr::params`: Sets parameter defaults based on fact values.

### Parameters

#### blcr

#####`package_require`

Package 'require' property (defaults to undef).

#####`package_ensure`

Package 'ensure' property (defaults to 'present').

#####`package_name`

blcr package name.

#####`modules_package_ensure`

Package 'ensure' property for blcr-modules (defaults to 'present').

#####`modules_package_name`

The 'blcr-modules' package name which is based off the `kernelrelease` fact.

#####`libs_package_name`

blcr-libs package name.

#####`install_dev`

Boolean.  Determines if the blcr-devel package should be installed (defaults to true).

#####`dev_package_name`

blcr dev package name.

#####`install_testsuite`

Boolean.  Determines if the blcr-testsuite package should be installed (defaults to false).

#####`testsuite_package_name`

blcr-testsuite package name.

#####`service_name`

blcr service name.

#####`service_ensure`

blcr service 'ensure' property (defaults to 'running').

#####`service_enable`

blcr service 'enable' property (defaults to true).

#####`service_autorestart`

Boolean.  Determines if changes should restart the blcr service (defaults to true).

#####`service_hasstatus`

blcr service hasstatus value.

#####`service_hasrestart`

blcr service hasrestart value.

## Limitations

This module has been tested on:

* CentOS 6.5 x86_64

## Development

### Testing

Testing requires the following dependencies:

* rake
* bundler

Install gem dependencies

    bundle install

Run unit tests

    bundle exec rake test

If you have Vagrant >= 1.2.0 installed you can run system tests

    bundle exec rake beaker

The following environment variables can be used to modify the behavior of the beaker tests:

* *BEAKER_destroy* - Values are "yes" or "no" to prevent VMs from being destroyed after tests.  Defaults to **yes**.
* *BEAKER\_blcr\_yumrepo\_baseurl* - **Required** URL to Yum repository containing BLCR RPMs.

## TODO

## Further Information

* https://upc-bugs.lbl.gov/blcr/doc/html/BLCR_Admin_Guide.html
