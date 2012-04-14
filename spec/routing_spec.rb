require 'spec_helper'

describe UtopiaData, "Routing", :type => :routing do
  include Rails.application.routes.url_helpers

  before(:each) do
    load_resources { UtopiaData.register(:lei) }
  end

  it "should route the index path" do
    leis_path.should == "/leis"
  end

  it "should route the show path" do
    lei_path(1).should == "/leis/1"
  end
end