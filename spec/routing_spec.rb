require 'spec_helper'

describe UtopiaData, "Routing", :type => :routing do
  include Rails.application.routes.url_helpers

  describe "simple routes" do
    before(:each) do
      load_resources { UtopiaData.register(:lei) }
    end

    it "should route the index path" do
      leis_path.should == "/leis"
    end

    it "should route the show path" do
      lei_path(1).should == "/leis/1"
    end

    it "should not create edit path" do
      expect{ edit_lei_path(1) }.to raise_error(NoMethodError)
    end

    it "should not create new path" do
      expect{ new_lei_path(1)}.to raise_error(NoMethodError)
    end
  end

  describe "nested routes" do
    before(:each) do
      UtopiaData.unload!
      load_resources do
        UtopiaData.register :lei do
          routes do
            resources :votes
          end
        end
       end
    end

    it "should created a nested route to leis" do
      lei_votes_path(1).should == "/leis/1/votes"
    end
  end
end