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
  # UtopiaData::Application object is to manipulate the utopia system, here
  # register the resources
  class Application
    # A hash of all the registered resources
    attr_accessor  :resources

    # create a default value to resources and
    def initialize
      self.resources ||= {}
    end

    def setup(&block)
    end

    def register(resource_name, options = {}, &block)
      find_or_create_resource(resource_name, options, &block)
    end

    def find_or_create_resource(name, options = {}, &block)
      return @resources[name] if resources[name]
      resource = Resource.new(name, options, &block)
      @resources[name] = resource
    end
  end
end
