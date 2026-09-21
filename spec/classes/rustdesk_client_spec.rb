require 'spec_helper'

describe 'rustdesk::client' do
  on_supported_os.each do |os, os_facts|
    context "on #{os}" do
      let(:facts) { os_facts }

      context 'when enabled' do
        let(:params) do
          {
            'enable' => true,
            'version' => '1.4.9',
            'extra_dependencies' => [],
          }
        end

        it { is_expected.to compile }
        it { is_expected.to contain_package('libxcb-randr0') }
        it { is_expected.to contain_archive('/tmp/rustdesk-1.4.9-x86_64.deb') }
        it { is_expected.to contain_package('rustdesk') }
        it { is_expected.to contain_service('rustdesk') }
      end

      context 'when disabled' do
        let(:params) do
          {
            'enable' => false,
            'version' => '1.4.9',
            'extra_dependencies' => [],
          }
        end

        it { is_expected.to compile }
        it { is_expected.to contain_package('rustdesk').with_ensure('absent') }
      end
    end
  end
end
