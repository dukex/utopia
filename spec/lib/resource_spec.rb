# encoding: utf-8

require 'spec_helper'

describe UtopiaData::Resource do
  subject { UtopiaData::Resource.new :people }

  describe '#build_route' do
    it 'returns grape route' do
      expected_route = <<-ROUTE
      resource :people do
        get do
          []
        end

        get ':id' do
          {}
        end
      end
      ROUTE

      expect(subject.build_routes.gsub!(/\s+/, ' ')).to eq(expected_route.gsub!(/\s+/, ' '))
    end
  end

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
