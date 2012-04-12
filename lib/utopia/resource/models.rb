#--
# Copyright (C) 2012 Emerson Vinicius Moreira de Almeida

# This file is part of Utopia source code.

# Utopia source code is free software; you can redistribute it
# and/or modify it under the terms of the GNU General Public License as
# published by the Free Software Foundation; either version 2 of the License,
# or (at your option) any later version.

# Utopia source code is distributed in the hope that it will be
# useful, but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.

# You should have received a copy of the GNU General Public License
# along with Foobar; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
#
#++

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
        @columns ||= []
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
