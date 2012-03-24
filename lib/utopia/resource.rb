require 'utopia/resource/naming'
require 'utopia/resource/controllers'

module Utopia
  class Resource
    include Naming
    include Controllers

    # The name of the resource class
    attr_reader :resource_class_name
    attr_reader :collection_actions
    # An array of member actions defined for this resource
    attr_reader :member_actions
    
    def initialize(resource_name, options = {})
        #@namespace = namespace
        @resource_class_name = "#{resource_name.to_s.classify}"
        @options = options
        puts @options if @options.nil?
        #@sort_order = @options[:sort_order]
        @member_actions, @collection_actions = [], []
        create_model
      end

          # The class this resource wraps. If you register the Post model, Resource#resource_class
    # will point to the Post class
    def resource_class
      ActiveSupport::Dependencies.constantize(resource_class_name)
    end

    private

    def create_model
      eval "class ::#{resource_class_name} < ActiveRecord::Base; end"
    end
  end
end