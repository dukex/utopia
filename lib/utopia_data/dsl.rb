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

  #
  # The UtopiaData DSL. This class is where all the registration blocks
  # are instance eval'd. This is the central place for the API given to
  # users of UtopiaData
  #
  class DSL
    # Runs the registration block inside this object
    def run_registration_block(config, &block)
      @config = config
      instance_eval &block if block_given?
    end

    private

    # The instance of UtopiaData::Config that's being registered
    # currently. You can use this within your registration blocks to
    # modify options:
    #
    # eg:
    #
    #   UtopiaData.register :post do
    #     config.table_name = "por22"
    #   end
    #
    def config
      @config
    end

  end
end