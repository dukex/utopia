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

require "utopia_data/engine"

module UtopiaData
  autoload :Application,          'utopia_data/application'
  autoload :BaseController,       'utopia_data/base_controller'
  autoload :DSL,                  'utopia_data/dsl'
  autoload :Resource,             'utopia_data/resource'
  autoload :ResourceController,   'utopia_data/resource_controller'
  autoload :ResourceDSL,          'utopia_data/resource_dsl'
  autoload :ModelDSL,             'utopia_data/model_dsl'

  class << self
    # the Application to this application
    def application
      @application ||= ::UtopiaData::Application.new
    end

    # TODO: documentation
    def setup

    end

    delegate :register,      :to => :application
    delegate :routes,        :to => :application
    delegate :load!,         :to => :application
    delegate :unload!,         :to => :application
  end
end