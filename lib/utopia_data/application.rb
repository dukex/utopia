module UtopiaData
  # UtopiaData::Application object is to manipulate the utopia system, here
  # register the resources
	class Application
    # A hash of all the registered resources
    attr_accessor  :resources

    # create a default value to resources and
    def initialize
      self.resources ||= {}
    end

    def register(resource_name, options = {}, &block)
      find_or_create_resource(resource_name, options, &block)
    end

    def find_or_create_resource(name, options = {}, &block)
      return @resources[name] if resources[name]
      resource = Resource.new(name, options, &block)
      @resources[name] = resource
    end
  end
end
