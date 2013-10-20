# encoding: utf-8

require 'spec_helper'

describe UtopiaData::Resource do
  subject { UtopiaData::Resource.new :people }

  describe '#build_route' do
    it 'returns grape route' do
      expected_route = <<-ROUTE
      resource :people do
        get do
          Person.all
        end

        get ':id' do
          Person.find(params[:id])
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
      person = Person.create! name: 'Duke'
      get "/people/#{person.id}"
      expect(last_response.status).to eq(200)
      expect(JSON.parse(last_response.body)).to eq({"id"=>person.id, "name"=>"Duke"})
    end
  end

  describe "Model" do
    context "Database" do
      context "without custom config" do
        it "should set table name to lei" do
          expect(subject.model.table_name).to eq('people')
        end

        it "should be model columns" do
        # subject.columns.should == ["id", "created_at", "updated_at", "number"]
      end

      it "should have attributes accessible" do
        #subject.model.create! number: "13XP"
        #subject.model.last.number.should == "13XP"
      end
    end

    context "with custom config" do

      it "should set columns only with name" do
        #custom_resource = subject do
        #  attributes do
        #    set :name
        #  end
        #end
        #custom_resource.columns.should == ["name"]
      end

      it "should set has_many relationship" do
        #custom_resource = subject do
        #  model do
        #    has_many :status
        #  end
        #end
        #custom_resource.model.reflect_on_all_associations[0].name.should == :status
      end
    end
  end
end
end
