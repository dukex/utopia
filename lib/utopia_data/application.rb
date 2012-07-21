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

require 'utopia_data/router'

module UtopiaData
  # In UtopiaData 0.0.1, UtopiaData::Application object is to manipulate the utopia system, here
  # there are the recources, loads, start routes, etc
	class Application
    # A hash of all the registered resources
    attr_accessor  :resources, :load_paths

    # create a default value to resources and
    # Load paths for utopia configurations. Add folders to this load path
    # to load up other resources for utopia.
    def initialize
      self.resources ||= {}
      self.load_paths = [File.expand_path('app/resource', Rails.root)]
    end

    # === Register a resource
    # You can register a resource using the generetor resource, only run:
    #   rails g utopia:resource lei
    #
    # This command you be create a lei.rb path on app/resource with the content
    #   UtopiaData.register :lei do
    #      configs...
    #   end
    #
    # or
    #
    #   UtopiaData.regsiter :lei
    #
    # After, you can enter on */leis.json* for example and see your resource expose
    #
    def register(resource_name, options = {}, &block)
      resource = find_or_create_resource(resource_name, options, &block)
    end

    # The Router to this application
    #
    def router
      @router ||= Router.new(self)
    end

    # Create the routes to resource on your application
    # use:
    #
    #   YourApplication::Application.routes.draw do
    #     UtopiaData.routes(self)
    #   end
    #
    def routes(rails_router)
      load!
      router.apply(rails_router)
    end

    def find_or_create_resource(name, options = {}, &block) # :nodoc:
      return @resources[name] if resources[name]
      return unless ActiveRecord::Migration.table_exists?(:"#{table_name(options, name.to_s)}")

      resource = Resource.new(name, options, &block)

      @resources[name] = resource
    end

    @@loaded = false

    # verify if the application is loaded or not
    def loaded?
      @@loaded
    end

    # Load set @loaded to false
    def unload!
      @resources = {}
      @@loaded = false
    end

    # unload files in _files_in_load_path_ and set @loaded to true
    def load!
      return false if loaded?
      files_in_load_path.each{|file| load file }

      @@loaded = true
    end
    # get files to (re)load
    def files_in_load_path
      load_paths.flatten.compact.uniq.collect{|path| Dir["#{path}/**/*.rb"] }.flatten
    end

    def table_name(config, resource_name)
      config[:table_name].nil? ? "#{resource_name.downcase.pluralize}" : config[:table_name]
    end
  end
end