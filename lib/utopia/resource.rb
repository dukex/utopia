require 'utopia/resource/naming'
require 'utopia/resource/models'
require 'utopia/resource/controllers'

module Utopia
  class Resource
    include Naming
    include Controllers
    include Models

    # The name of the resource class
    attr_reader :resource_class_name
    # The configuration to resource
    attr_accessor :config

    def initialize(resource_name, options = {}, &block)
      @config ||= {}
      parse_registration_block(self, &block) if block_given?
      @resource_class_name = "#{resource_name.to_s.classify}"
      @options = options
      create!
    end

    # The class this resource wraps. If you register the Post model, Resource#resource_class
    # will point to the Post class
    def resource_class
      ActiveSupport::Dependencies.constantize(resource_class_name)
    end

    def resource_table_name
      resource_class.quoted_table_name
    end

    protected

    def resource_dsl
      @resource_dsl ||= ResourceDSL.new
    end

    def parse_registration_block(config, &block)
      resource_dsl.run_registration_block(config, &block)
    end
  end
end