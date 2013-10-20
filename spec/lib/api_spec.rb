# encoding: utf-8

require 'spec_helper'

describe UtopiaData::Api do
  it 'use Grape' do
    expect(UtopiaData::Api.new).to be_kind_of(Grape::API)
  end
  it 'format json' do
    expect(UtopiaData::Api.format).to eq(:json)
  end
end
