## treydock-blcr changelog

Release notes for the treydock-blcr module.

------------------------------------------

#### 1.0.1 - 2014-10-10

This release updates README.md

------------------------------------------

#### 1.0.0 - 2014-10-10

This release contains backwards compatible features.

* Manage blcr-libs and blcr-testsuite
* Add install_testsuite parameter to optionally install blcr-testsuite
* Add modules\_package\_ensure parameter
  * This is intended to allow package_ensure and module\_package\_name to be used together to set blcr-modules version
* Add service_autorestart parameter to disable restarting services if set to true
* Rework the order of package installation so that the blcr-modules package is first.
  * This allows for something like blcr-dkms to be installed in place of blcr-modules
* Add beaker acceptance tests
* Update unit testing configurations - initial use of modulesync

------------------------------------------

#### 0.0.1 - 2014-08-11

* Initial release
