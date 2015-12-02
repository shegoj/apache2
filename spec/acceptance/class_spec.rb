require 'spec_helper_acceptance'

describe "apache1 class:" do

  context 'default parameters' do
    it 'should run successfully' do
      pp = <<-EOF
        class { 'apache1':

        }

      EOF

      apply_manifest(pp, :catch_failures => true)
      expect(apply_manifest(pp, :catch_failures => true).exit_code).to be_zero
    end
  end

end
