require "utopia/engine"

module Utopia
  autoload :Application, 'utopia/application'
  autoload :Resource, 'utopia/resource'

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