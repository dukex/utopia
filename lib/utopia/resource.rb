require 'utopia/resource/naming'
require 'utopia/resource/controllers'

module Utopia
  class Resource
    include Naming
    include Controllers

    # The name of the resource class
    attr_reader :resource_class_name
    # An array of collection actions defined for this resource
    attr_reader :collection_actions
    # An array of member actions defined for this resource
    attr_reader :member_actions

    def initialize(resource_name, options = {})
      @resource_class_name = "#{resource_name.to_s.classify}"
      @options = options
      @member_actions, @collection_actions = [], []
      create_resource_model
      create_resource_controller
    end

    # The class this resource wraps. If you register the Post model, Resource#resource_class
    # will point to the Post class
    def resource_class
      ActiveSupport::Dependencies.constantize(resource_class_name)
    end

    private

    # Create the resource model
    def create_resource_model
      eval "class ::#{resource_class_name} < ActiveRecord::Base; end"
    end

    # Create the resource controller
    def create_resource_controller
      controller_class = <<-CONTROLLER
      class ::#{controller_name} < Utopia::ResourceController
        responders Roar::Rails::Responder
      end
      CONTROLLER

      eval controller_class
      controller.utopia_config = self
    end
  end
end