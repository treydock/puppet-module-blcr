shared_context "blcr::service" do
  it do
    should contain_service('blcr').only_with({
      :ensure      => 'running',
      :enable      => 'true',
      :name        => 'blcr',
      :hasstatus   => 'true',
      :hasrestart  => 'true',
    })
  end
end
