require 'spec_helper'

module UtopiaData
  describe Resource do
    before { load_defaults! }
    before(:each){  Object.send(:remove_const, :Lei) }
    let(:application){ UtopiaData::Application.new }

    describe "#resource_table_name" do
      it "should return the resource's table name" do
        Resource.new(:lei).resource_table_name.should == '"leis"'
      end
      context "when the :as option is given" do
        it "should return the resource's table name" do
          Resource.new(:lei, :as => "Minhas Leis").resource_table_name.should == '"leis"'
        end
      end
    end

    describe "controller name" do
      it "should return a namespaced controller name" do
        Resource.new(:lei).controller_name.should == "LeisController"
      end
    end
  end
end