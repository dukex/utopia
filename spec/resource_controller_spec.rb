require 'spec_helper'

describe Utopia::ResourceController do
  let(:controller) { Utopia::ResourceController.new }

end

describe LeisController, :type => "controller" do
  %w(edit update destroy new create).each do |action|
    it "should not respond to #{action}" do
      subject.should_not respond_to(action)
    end
  end

  %w(json xml).each do |format| # cvs
    it "should respond 200 when format is #{format}" do
      get :index, :format => format
      response.code.should == "200"
    end
  end
end