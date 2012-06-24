require 'spec_helper'

describe UtopiaData do
  %w(register routes).each do |method|
    it "delegates ##{method} to application" do
      UtopiaData.application.should_receive(method)
      UtopiaData.send(method)
    end
  end

  it "should be Application" do
    UtopiaData.application.class.should == UtopiaData::Application
  end

end