module Utopia
  class Resource
    module Controllers

      # Returns a properly formatted controller name for this
      # config within its namespace
      def controller_name
        #[resource_name.plural.camelize + "Controller"].compact.join('::')
      end

      # Returns the controller for this config
      def controller
        #@controller ||= controller_name.constantize
      end

      # Returns a symbol for the route to use to get to the
      # collection of this resource
      def route_collection_path
        #route = [
        #  controller.resources_configuration[:self][:route_collection_name],
        #  'path'
        #]

        #route.compact.join('_').to_sym
      end
    end
  end
end