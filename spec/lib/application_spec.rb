# encoding: utf-8

require 'spec_helper'

describe UtopiaData::Application do
  describe '#register' do
    it 'create a resource' do
      subject.register :x
      expect(subject.resources[:x]).to is_a(Resource)
    end
  end
end
