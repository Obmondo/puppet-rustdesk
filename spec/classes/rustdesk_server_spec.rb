require 'spec_helper'

describe 'rustdesk::server' do
  on_supported_os.each do |os, os_facts|
    context "on #{os}" do
      let(:facts) { os_facts }

      context 'when enabled' do
        let(:params) do
          {
            'enable' => true,
            'version' => '1.8.6',
            'extra_dependencies' => [],
          }
        end

        it { is_expected.to compile }
        it { is_expected.to contain_package('rustdesk-server-hbbs') }
        it { is_expected.to contain_package('rustdesk-server-hbbr') }
        it { is_expected.to contain_service('hbbs') }
        it { is_expected.to contain_service('hbbr') }
      end

      context 'when disabled' do
        let(:params) do
          {
            'enable' => false,
            'version' => '1.8.6',
            'extra_dependencies' => [],
          }
        end

        it { is_expected.to compile }
        it { is_expected.to contain_package('rustdesk-server-hbbs').with_ensure('absent') }
        it { is_expected.to contain_package('rustdesk-server-hbbr').with_ensure('absent') }
      end
    end
  end
end
