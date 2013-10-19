# encoding: utf-8
#
#    Easy way to open data
#    Copyright (C) 2013 Duke<duke@riseup.net>
#
#    This program is free software: you can redistribute it and/or modify
#    it under the terms of the GNU Affero General Public License as
#    published by the Free Software Foundation, either version 3 of the
#    License, or (at your option) any later version.
#
#    This program is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU Affero General Public License for more details.
#
#    You should have received a copy of the GNU Affero General Public License
#    along with this program.  If not, see <http://www.gnu.org/licenses/>.
module UtopiaData
  # Create and build resource
  class Resource
    # TODO: TEST
    def initialize(resource_name, options = {}, &block)
      @name = resource_name
      # parse_registration_block(self, &block) if block_given?
      # @options = options
      create!
    end

    def create!
      route
    end

    private

      def resource_dsl
      #  @resource_dsl ||= ResourceDSL.new
      end

      def parse_registration_block(the_resource, &block)
      #  resource_dsl.run_registration_block(the_resource, &block)
      end

      def route
        Api.class_eval Route.create(@name)
      end
  end
end
