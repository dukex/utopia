# encoding: utf-8

require 'spec_helper'

describe UtopiaData::Route do
  describe '.build' do
    it 'returns grape route' do
      expected_route = <<-ROUTE
        resource :x do
          get do
            []
          end

          get ':id' do
            {}
          end
        end
      ROUTE

      expect(UtopiaData::Route.build(:x)).to eq(expected_route)
    end
  end
end
