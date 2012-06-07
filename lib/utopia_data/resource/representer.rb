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

require 'roar/representer/json'
require 'roar/representer/feature/hypermedia'

module UtopiaData
  class Resource
    module Representer
      def create_resource_representer
        representer_module = <<-MODEL
          module ::#{model_name}Representer
            include Roar::Representer::JSON
            include Roar::Representer::Feature::Hypermedia

            #{columns.map{|c| "property :#{c}" }.join("\n")}

            #{model.reflect_on_all_associations.map{|c| "collection :#{c.name}"  }.join("\n")}

            link :self do
              #{resource_name.singular}_url(self)
            end

            link :#{resource_name.plural} do
              #{resource_name.plural}_url
            end
          end
        MODEL
        eval representer_module
      end
    end
  end
end