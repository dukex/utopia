require "utopia_data/version"
require "utopia_data/application"
require "utopia_data/resource"
require 'forwardable'

module UtopiaData
  autoload :Api, 'utopia_data/api'

  class << self
    extend Forwardable

    # the application intance
    def application
      @application ||= ::UtopiaData::Application.new
    end

    # register a new resource
    def_delegator :application, :register, :register
  end
end
