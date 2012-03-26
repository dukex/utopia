require 'spec_helper'

describe Utopia do
  %w(register routes).each do |method|
    it "delegates ##{method} to application" do
      Utopia.application.should_receive(method)
      Utopia.send(method)
    end
  end

  it "should be Application" do
    Utopia.application.class.should == Utopia::Application
  end
end