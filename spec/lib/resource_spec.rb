# encoding: utf-8

require 'spec_helper'

describe UtopiaData::Resource do
  subject { UtopiaData::Resource.new :people }

  describe "#register" do
    include Rack::Test::Methods

    def app
      UtopiaData::Api
    end

    before do
      subject
    end

    it 'create index resource path' do
      get '/people'
      expect(last_response.status).to eq(200)
      expect(JSON.parse(last_response.body)).to eq([])
    end

    it 'create show resource path'  do
      get '/people/1'
      expect(last_response.status).to eq(200)
      expect(JSON.parse(last_response.body)).to eq({})
    end
  end
end
