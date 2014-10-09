shared_context "blcr::install" do
  it { should have_package_resource_count(4) }

  it do
    should contain_package('blcr-modules').only_with({
      :ensure => 'present',
      :name   => 'blcr-modules_2.6.32_431.23.3.el6.x86_64',
      :before => 'Package[blcr-libs]',
    })
  end

  it do
    should contain_package('blcr-libs').only_with({
      :ensure => 'present',
      :name   => 'blcr-libs',
      :before => 'Package[blcr]',
    })
  end

  it do
    should contain_package('blcr').only_with({
      :ensure => 'present',
      :name   => 'blcr',
    })
  end

  it do
    should contain_package('blcr-devel').only_with({
      :ensure   => 'present',
      :name     => 'blcr-devel',
      :require  => 'Package[blcr-libs]',
    })
  end

  it { should_not contain_package('blcr-testsuite') }

  context 'when install_dev => false' do
    let(:params) {{ :install_dev => false }}

    it { should have_package_resource_count(3) }

    it { should_not contain_package('blcr-devel') }
  end

  context 'when install_testsuite => true' do
    let(:params) {{ :install_testsuite => true }}

    it { should have_package_resource_count(5) }

    it do
      should contain_package('blcr-testsuite').only_with({
        :ensure   => 'present',
        :name     => 'blcr-testsuite',
        :require  => 'Package[blcr]',
      })
    end
  end

  context 'when package_require => Yumrepo[foo]' do
    let(:params) {{ :package_require => 'Yumrepo[foo]' }}

    it { should contain_package('blcr-modules').with_require('Yumrepo[foo]') }
    it { should contain_package('blcr-libs').with_require('Yumrepo[foo]') }
    it { should contain_package('blcr').with_require('Yumrepo[foo]') }
    it { should contain_package('blcr-devel').with_require(['Package[blcr-libs]', 'Yumrepo[foo]']) }
  end
end
