require 'spec_helper'

module UtopiaData
  describe Resource, "Models" do

    before { load_defaults! }
    before(:each){  Object.send(:remove_const, :Lei) }

    def resource(options = {}, &block)
      Resource.new(:lei, options, &block)
    end

    context "without custom config" do
      it "should set table name to lei" do
        resource.model.table_name.should == 'leis'
      end

      it "should be model columns" do
        resource.columns.should == ["id", "created_at", "updated_at", "number"]
      end

      it "should have attributes accessible" do
        resource.model.create! number: "13XP"
        resource.model.last.number.should == "13XP"
      end
    end

    describe "with custom config" do

      it "should set columns only with name" do
        custom_resource = resource do
          attributes do
            set :name
          end
        end
        custom_resource.columns.should == ["name"]
      end

      it "should set has_many relationship" do
        custom_resource = Resource.new :lei, {} do
          model do
            has_many :status
          end
        end
        custom_resource.model.reflect_on_all_associations[0].name.should == :status
      end
    end
  end
end