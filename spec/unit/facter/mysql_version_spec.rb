# frozen_string_literal: true

require 'spec_helper'

describe Facter::Util::Fact.to_s do
  before(:each) do
    Facter.clear
  end

  describe 'mysql_version' do
    context 'with value' do
      before :each do
        Facter::Core::Execution.stubs(:which).returns('fake_mysql_path')
        Facter::Util::Resolution.stubs(:exec).with('mysql --version').returns('mysql  Ver 14.12 Distrib 5.0.95, for redhat-linux-gnu (x86_64) using readline 5.1')
      end
      it {
        expect(Facter.fact(:mysql_version).value).to eq('5.0.95')
      }
    end
  end
end
