require 'spec_helper'

describe UtopiaData do
  include Rack::Test::Methods

  subject do
    UtopiaData.register :people do
    end
  end

  def app
    MyTestApp
  end

  it "index resource path" do
    get "/people"
    last_response.status.should == 200
    JSON.parse(last_response.body).should == []
  end

  it "show resource path"  do
    get "/people/1"
    last_response.status.should == 200
    JSON.parse(last_response.body).should == []
  end
end
