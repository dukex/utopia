require "utopia/engine"

# = Utopia Module
#
# This is the base module of the system
#


module Utopia
  autoload :Application,          'utopia/application'
  autoload :BaseController,       'utopia/base_controller'
  autoload :Resource,             'utopia/resource'
  autoload :ResourceController,   'utopia/resource_controller'

  class << self

    attr_accessor :application

    def application
      @application ||= ::Utopia::Application.new
    end

    def setup
      # application.setup!
      # yield(application)
      # application.prepare!
    end

    delegate :register,      :to => :application
    delegate :routes,        :to => :application
    delegate :load!,         :to => :application
  end
end