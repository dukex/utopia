# encoding: utf-8

require 'utopia_data/version'
require 'utopia_data/application'
require 'utopia_data/resource'
require 'forwardable'

# UtopiaData
# @todo: documentation
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
    def_delegator :application, :setup, :setup
  end
end
