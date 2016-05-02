require 'spec_helper'
require 'os'

describe Puppet_X::Coi::Jboss::Internal::Executor::JbossCommandExecutor do

  describe '#run_command' do

      let(:instance) { described_class.new }
      subject { instance.run_command(cmd) }

      context 'with correct command' do
        if OS.windows?
          let(:cmd) { 'dir' }
          it { expect { subject}.to_not raise_error }
        elsif OS.osx?
          let(:cmd) { 'ls' }
          it { expect { subject}.to_not raise_error }
        elsif OS.linux?
          let(:cmd) { 'ls' }
          it { expect { subject}.to_not raise_error }
        end
      end

      context 'with incorrect command' do
        if OS.windows?
          let(:cmd) { 'ls' }
          it { expect { subject}.to raise_error }
        elsif OS.osx?
          let(:cmd) { 'dir' }
          it { expect { subject}.to raise_error }
        elsif OS.linux?
          let(:cmd) { '123' }
          it { expect { subject}.to raise_error }
        end
      end
  end

  describe '#child_status' do

    before :each do
      instance.instance_variable_set(:@result, 'mocked result')
    end

    let(:instance) { described_class.new }
    subject { instance.child_status }

    it { expect(subject).to be_truthy }
  end

end
