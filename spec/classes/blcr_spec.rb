require 'spec_helper'

describe 'blcr' do
  let :facts do
    {
      :osfamily       => 'RedHat',
      :kernelrelease  => '2.6.32-431.23.3.el6.x86_64',
    }
  end

  it { should create_class('blcr') }
  it { should contain_class('blcr::params') }

  it { should contain_anchor('blcr::start').that_comes_before('Class[blcr::install]') }
  it { should contain_class('blcr::install').that_notifies('Class[blcr::service]') }
  it { should contain_class('blcr::service').that_comes_before('Anchor[blcr::end]') }
  it { should contain_anchor('blcr::end') }

  include_context 'blcr::install'
  include_context 'blcr::service'

  context 'when service_autorestart => false' do
    let(:params) {{ :service_autorestart => false }}

    it { should contain_anchor('blcr::start').that_comes_before('Class[blcr::install]') }
    it { should contain_class('blcr::install').that_comes_before('Class[blcr::service]') }
    it { should contain_class('blcr::service').that_comes_before('Anchor[blcr::end]') }
    it { should contain_anchor('blcr::end') }
  end

  # Test validate_bool parameters
  [
    :install_dev,
    :install_testsuite,
    :service_autorestart,
  ].each do |p|
    context "when #{p} => 'foo'" do
      let(:params) {{ p => 'foo' }}
      it "should raise an error" do
        expect { should compile }.to raise_error(/is not a boolean/)
      end
    end
  end

end
