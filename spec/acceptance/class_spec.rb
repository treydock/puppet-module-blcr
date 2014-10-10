require 'spec_helper_acceptance'

describe 'blcr class:' do
  context 'default parameters' do
    it 'should run successfully' do
      pp =<<-EOS
      yumrepo { 'blcr':
        descr     => 'blcr',
        enabled   => '1',
        gpgcheck  => '0',
        baseurl   => '#{RSpec.configuration.blcr_yumrepo_baseurl}',
      }
      class { 'blcr':
        package_require => 'Yumrepo[blcr]'
      }
      EOS

      apply_manifest(pp, :catch_failures => true)
      apply_manifest(pp, :catch_changes => true)
    end

    describe package('blcr-libs') do
      it { should be_installed }
    end

    describe package('blcr') do
      it { should be_installed }
    end

    describe package('blcr-devel') do
      it { should be_installed }
    end

    describe package('blcr-testsuite') do
      it { should_not be_installed }
    end

    describe service('blcr') do
      it { should be_enabled }
      it { should be_running }
    end
  end
end
