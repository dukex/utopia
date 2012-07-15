require 'spec_helper'

module UtopiaData
  describe Resource, "Naming" do

    before { load_defaults! }

    let(:application){ UtopiaData::Application.new }

    def config(options = {}, &block)
      @config = Resource.new(:lei, options, &block)
    end

    describe "config_names" do
      it "should set resource_name_class as 'Lei'" do
        config.resource_name_class.should == 'Lei'
      end

      it "should set a custom class name"
    end

    describe "model_name" do
      it "should set resource_name_class as Lei" do
        config.model_name.should == 'Lei'
      end
    end

      describe "table_name" do #
        it "should test"
      end

      describe "model_class" do #
        it "should test"
      end

      describe "resource_name" do #
        it "should test"
     end

      describe "representer_name" do #
        it "should test"
      end


      describe "controller_class" do #
        it "should test"
     end

      describe "controller_name" do #
        it "should test"
      end
   end
 end