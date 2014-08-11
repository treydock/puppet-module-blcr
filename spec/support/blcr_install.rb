shared_context "blcr::install" do
  it { should have_package_resource_count(3) }

  it do
    should contain_package('blcr').only_with({
      :ensure   => 'present',
      :name     => 'blcr',
    })
  end

  it do
    should contain_package('blcr-modules').only_with({
      :ensure   => 'present',
      :name     => 'blcr-modules_2.6.32_431.23.3.el6.x86_64',
    })
  end

  it do
    should contain_package('blcr-devel').only_with({
      :ensure   => 'present',
      :name     => 'blcr-devel',
    })
  end

  context 'when install_dev => false' do
    let(:params) {{ :install_dev => false }}
    it { should have_package_resource_count(2) }
    it { should_not contain_package('blcr-devel') }
  end
end
