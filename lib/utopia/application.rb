require 'utopia/router'

module Utopia
  # In Utopia 0.0.1, Utopia::Application object is to manipulate the utopia system, here
  # there are the recources, loads, start routes, etc
	class Application

    # A hash of all the registered resources
    attr_accessor  :resources, :load_paths

    # create a default value to resources and
    # Load paths for utopia configurations. Add folders to this load path
    # to load up other resources for utopia.
    def initialize
      self.resources ||= {}
      self.load_paths = [File.expand_path('app/resource', Rails.root)]
    end

    # === Register a resource
    # You can register a resource using the generetor resource, only run:
    #   rails g utopia:resource lei
    #
    # This command you be create a lei.rb path on app/resource with the content
    #   Utopia.register :lei
    #
    # After, you can enter on */leis.json* for example and see your resource expose
    #
    def register(resource_name, options = {}, &block)
      resource = find_or_create_resource(resource_name)
    end

    def router # :nodoc:
      @router ||= Router.new(self)
    end

    def routes(rails_router) # :nodoc:
      load!
      router.apply(rails_router)
    end

    def find_or_create_resource(name) # :nodoc:
      return @resources[name] if resources[name]
      resource = Resource.new(name)
      @resources[name] = resource
    end

    @@loaded = false

    def loaded? # :nodoc:
      @@loaded
    end

    # Load files in _files_in_load_path_ var
    def load!
      return false if loaded?
      files_in_load_path.each{|file| load file }

      @@loaded = true
    end

    # Returns ALL the files to load from all the load paths
    def files_in_load_path # :nodoc:
      load_paths.flatten.compact.uniq.collect{|path| Dir["#{path}/**/*.rb"] }.flatten
    end
  end
end