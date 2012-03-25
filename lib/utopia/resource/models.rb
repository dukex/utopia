module Utopia
  class Resource
    module Models
      def model_name
        resource_class_name
      end

      def model
        @model ||= resource_class
      end

      def attributes(&block)
        @columns = []
        instance_eval &block if block_given?
      end

      def set(attribute, options = {})
        @columns << attribute
      end

      def columns
        @columns ||= model.column_names.map(&to_sym)
      end

      # Create the resource model
      def create_resource_model
        table_name = @config[:table_name] ? "self.table_name = '#{@config[:table_name]}'" : nil
        model_class = <<-MODEL
          class ::#{model_name} < ActiveRecord::Base
            #{table_name}
            attr_accessor #{columns.join(", ")}
          end
        MODEL
        eval model_class
      end
    end
  end
end
