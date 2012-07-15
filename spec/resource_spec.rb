require 'spec_helper'

module UtopiaData
  describe Resource do
    before { load_defaults! }
    # before(:each){  Object.send(:remove_const, :Lei) }
    let(:application){ UtopiaData::Application.new }
  end
end