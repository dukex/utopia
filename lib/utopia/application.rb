require 'utopia/router'
require 'utopia/helpers/settings'

module Utopia
	class Application
    include Settings

    setting :load_paths, [File.expand_path('app/resource', Rails.root)]

    attr_accessor  :resources
    def initialize
      @resources = {}
    end

    def register(resource_name, options = {}, &block)
      resource = find_or_create_resource(resource_name)
    end

    def router
      @router ||= Router.new(self)
    end

    def routes(rails_router)
      router.apply(rails_router)
    end

    def find_or_create_resource(name)
      #return resources[name] if resources[name]
      resource = Resource.new(name)
      @resources[name] = resource
      #Utopia::Event.dispatch Utopia::Namespace::RegisterEvent, namespace
      #yield(namespace) if block_given?
      #namespace
    end

    @@loaded = false

    def loaded?
      @@loaded
    end

    def load!
      return false if loaded?

      files_in_load_path.each{|file| load file }

      @@loaded = true
    end

    # Returns ALL the files to load from all the load paths
    def files_in_load_path
      load_paths.flatten.compact.uniq.collect{|path| Dir["#{path}/**/*.rb"] }.flatten
    end
  end
end