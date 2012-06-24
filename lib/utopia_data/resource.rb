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

require 'utopia_data/resource/naming'
require 'utopia_data/resource/models'
require 'utopia_data/resource/controllers'
require 'utopia_data/resource/representer'

module UtopiaData
  class Resource
    include Naming
    include Controllers
    include Models
    include Representer

    # The name of the resource class
    attr_reader :resource_class_name
    # The model class name
    attr_reader :model_class_name
    # The configuration to resource
    attr_accessor :config

    def initialize(resource_name, options = {}, &block)
      @config ||= {}
      @config[:model] ||= {}
      parse_registration_block(self, &block) if block_given?
      @resource_class_name = resource_name.to_s.classify
      @model_class_name = config[:class_name].nil? ? "#{resource_name.to_s.classify}" : config[:class_name]
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


    def parse_registration_block(the_resource, &block)
      resource_dsl.run_registration_block(the_resource, &block)
    end

    def create!
      create_resource_model
      create_resource_representer
      create_resource_controller
    end
  end
end