module Utopia
  class Resource

    module Naming

      # Returns a name used to uniquely identify this resource
      # this should be an instance of ActiveAdmin:Resource::Name, which responds to
      # #singular, #plural, #route_key, #human etc.
      def resource_name
        custom_name = @options[:as] && @options[:as].gsub(/\s/,'')
        @resource_name ||= if custom_name || !resource_class.respond_to?(:model_name)
          Resource::Name.new(resource_class, custom_name)
        else
          Resource::Name.new(resource_class)
        end
      end

      # Returns the name to call this resource such as "Bank Account"
      def resource_label
        if @options[:as]
          @options[:as]
        else
         resource_name.human(:default => resource_name.gsub('::', ' ')).titleize
       end
     end

     def plural_resource_label
      if @options[:as]
        @options[:as].pluralize
      else
        resource_name.human(:count => 3, :default => resource_label.pluralize).titleize
      end
    end
  end

    # A subclass of ActiveModel::Name which supports the different APIs presented
    # in Rails < 3.1 and > 3.1.
    class Name < ActiveModel::Name

      def initialize(klass, name = nil)
        super(klass, nil, name)
      end

      def route_key
        plural
      end
    end
  end
end