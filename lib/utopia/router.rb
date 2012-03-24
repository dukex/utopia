module Utopia
  class Router
    def initialize(application)
      @application = application
    end

    def apply(router)
      router.instance_exec(@application.resources) do |esources|
        esources.each do |k, config|
          route_definition_block = Proc.new do
            resources config.resource_name.route_key
          end
          instance_eval &route_definition_block
        end
      end
    end
  end
end