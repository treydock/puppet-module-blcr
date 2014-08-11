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

#####`modules_package_name`

The 'blcr-modules' package name which is based off the `kernelrelease` fact.

#####`install_dev`

Boolean.  Sets if the blcr-devel package should be installed (defaults to true).

#####`dev_package_name`

blcr dev package name.

#####`service_name`

blcr service name.

#####`service_ensure`

blcr service 'ensure' property (defaults to 'running').

#####`service_enable`

blcr service 'enable' property (defaults to true).

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

## TODO

## Further Information

* https://upc-bugs.lbl.gov/blcr/doc/html/BLCR_Admin_Guide.html
