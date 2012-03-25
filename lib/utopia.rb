require "utopia/engine"

module Utopia
  autoload :Application,          'utopia/application'
  autoload :BaseController,       'utopia/base_controller'
  autoload :Resource,             'utopia/resource'
  autoload :ResourceController,   'utopia/resource_controller'

  class << self

    # the utopia application with the methods to application work
    def application
      @application ||= ::Utopia::Application.new
    end

    # TODO: documentation
    def setup
    end

    delegate :register,      :to => :application
    delegate :routes,        :to => :application
    delegate :load!,         :to => :application
  end
end