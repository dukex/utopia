#--
# Copyright (C) 2012 Emerson Vinicius Moreira de Almeida

# This file is part of UtopiaData source code.

# UtopiaData source code is free software; you can redistribute it
# and/or modify it under the terms of the GNU General Public License as
# published by the Free Software Foundation; either version 2 of the License,
# or (at your option) any later version.

# UtopiaData source code is distributed in the hope that it will be
# useful, but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.

# You should have received a copy of the GNU General Public License
# along with Foobar; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
#
#++

module UtopiaData
  class Resource
    module Models
      # @return [String] the model class name
      def model_name
        resource_class_name
      end

      # @return [ActiveRecord] the model to current resource
      def model
        @model ||= resource_class
      end

      def attributes(&block)
        @columns = []
        instance_eval &block if block_given?
      end

      def set(attribute, options = {})
        @columns << attribute.to_s
      end

      def columns
        @columns ||= model.column_names
      end

      # Create the resource model
      def create_resource_model
        initialize_model
        configure_model
      end

      private
        def initialize_model
          model_class = <<-MODEL
            class ::#{model_name} < ActiveRecord::Base
              attr_accessible nil
            end
          MODEL
          eval model_class
        end

        def configure_model
          model_class = <<-MODEL
            class ::#{model_name}
              attr_accessible #{columns.map{|c| ":#{c}"}.join(", ")}
            end
          MODEL

          @config[:model].each do |config_model|
            @model.send config_model[0], config_model[1]
          end

          @model.table_name =  @config[:table_name] unless @config[:table_name].nil?
          eval model_class
        end
    end
  end
end
