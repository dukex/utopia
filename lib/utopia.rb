require "utopia/engine"

module Utopia
	autoload :Application, 'utopia/application'

	class << self

		attr_accessor :application

		def application
			@application ||= ::Utopia::Application.new
		end


		delegate :register,      :to => :application
		delegate :routes,        :to => :application
	end
end
