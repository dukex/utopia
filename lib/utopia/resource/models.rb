module Utopia
  class Resource
    module Models
      def model_name
        resource_class_name
      end
      def model
        @model ||= resource_class
      end

      # Create the resource model
      def create_resource_model
        table_name = @options[:table_name] ? "self.table_name = '#{@options[:table_name]}'" : nil
        model_class = <<-MODEL
          class ::#{model_name} < ActiveRecord::Base
            #{table_name}
          end
        MODEL
        eval model_class
      end
    end
  end
end
