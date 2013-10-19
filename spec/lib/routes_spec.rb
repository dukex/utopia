require 'spec_helper'

describe UtopiaData do
  include Rack::Test::Methods

  before do
    UtopiaData.register :people do
    end
  end

  def app
    UtopiaData::Api
  end

  it "index resource path" do
    get "/people"
    expect(last_response.status).to eq(200)
    expect(JSON.parse(last_response.body)).to eq([])
  end

  it "show resource path"  do
    get "/people/1"
    expect(last_response.status).to eq(200)
    expect(JSON.parse(last_response.body)).to eq({})
  end
end
