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
    end
  end
end