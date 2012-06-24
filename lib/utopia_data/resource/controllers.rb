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
    module Controllers

      # Returns a properly formatted controller name for this
      # config within its namespace
      def controller_name
        [resource_name.plural.camelize + "Controller"].compact.join('::')
      end

      # Returns the controller for this config
      def controller
        @controller ||= controller_name.constantize
      end

      # Create the resource controller
      def create_resource_controller
        controller_class = <<-CONTROLLER
          class ::#{controller_name} < UtopiaData::ResourceController
            responders Roar::Rails::Responder
            #{model.reflect_on_all_associations(:belongs_to).map{|association| "belongs_to :#{association.name}" }.join("\n")}

          end
        CONTROLLER

        eval controller_class
        controller.utopia_config = self
      end
    end
  end
end