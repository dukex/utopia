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
    module Naming
      attr_reader :resource_name
      attr_reader :resource_class

      # config the @resource_name_class, it will try use config[:class_name]
      def config_names(name)
        @resource_name_class = config[:class_name].nil? ? name.to_s.classify : config[:class_name]
      end

      # @return [String] the model class name
      def model_name #
        resource_name_class
      end

      def table_name #
        config[:table_name].nil? ? "#{resource_name_class.downcase.pluralize}" : config[:table_name]
      end

      def model_class #
        @model_class ||= ActiveSupport::Dependencies.constantize(resource_name_class)
      end

      alias_method  :resource_class, :model_class

      def resource_name #
        @resource_name ||= Resource::Name.new(model_class)
      end

      def representer_name #
        "#{resource_name}Representer"
      end

      def controller_class #
        @controller_class ||= ActiveSupport::Dependencies.constantize(controller_name)
      end

      def controller_name #
        "#{resource_name.pluralize}Controller"
      end

      #@model_class_name =
      #@controller_class_name = config[:class_name].nil? ? "#{resource_class_name.pluralize}Controller" : "#{config[:class_name]}Controller"

      #def resource_class_name
      #  @resource_class_name = resource_name
      #end
    end

    # A subclass of ActiveModel::Name which supports the different APIs presented
    # in Rails < 3.1 and > 3.1.
    class Name < ActiveModel::Name

      def initialize(klass, name = nil)
        super(klass, nil, name)
      end

     # def route_key
      #  plural
     # end
   end
 end
end