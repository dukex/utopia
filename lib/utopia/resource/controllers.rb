module Utopia
  class Resource
    module Controllers

      # Returns a properly formatted controller name for this
      # config within its namespace
      def controller_name
        [resource_name.plural.camelize + "Controller"].compact.join('::')
      end

      # Returns the controller for this config
      def controller
        @controller ||= controller_name.constantize
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
end