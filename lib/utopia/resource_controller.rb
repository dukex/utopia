module Utopia
  # All Resources Controller inherits from this controller.
  # It implements actions and helpers for resources.
  class ResourceController < BaseController
  	class << self
  		def utopia_config=(config)
  			@utopia_config = config

  			defaults  :resource_class => config.resource_class,
  								:instance_name => config.resource_name.singular
  		end
  	end
  end
end