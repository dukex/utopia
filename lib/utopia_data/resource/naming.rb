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