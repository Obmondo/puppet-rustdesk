require 'spec_helper'

describe 'rustdesk' do
  on_supported_os.each do |os, os_facts|
    context "on #{os}" do
      let(:facts) { os_facts }

      context 'with default parameters' do
        let(:params) do
          {
            'client_enable' => false,
            'client_version' => '1.4.9',
            'client_extra_dependencies' => [],
            'server_enable' => false,
            'server_version' => '1.8.6',
            'server_extra_dependencies' => [],
          }
        end

        it { is_expected.to compile }
        it { is_expected.to contain_class('rustdesk::client') }
        it { is_expected.to contain_class('rustdesk::server') }
      end
    end
  end
end
