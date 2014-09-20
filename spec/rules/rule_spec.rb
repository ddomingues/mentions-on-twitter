require 'spec_helper'

RSpec.describe Rules::Rule do

  it { expect{ subject.apply! [] }.to raise_error('Rule not implemented!') }

end