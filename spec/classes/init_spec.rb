require 'spec_helper'
describe 'apache2' do

  context 'with defaults for all parameters ehow' do
    it { should contain_class('apache2') }
  end
end
