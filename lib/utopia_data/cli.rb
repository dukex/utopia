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
require 'thor'
require 'active_support/inflector'

module UtopiaData
  # UtopiaData Command Line Interface
  class CLI < Thor
    include Thor::Actions
    attr_reader :name, :resource_name

    def self.source_root
      File.expand_path('../../..', __FILE__)
    end

    desc 'new project_name', 'Create a new utopia'
    def new(name)
      @name = name
      directory('templates/app', name, verbose: true)
      template('templates/config.ru.erb', "#{name}/config.ru")
      template('templates/app.erb', "#{name}/#{name}_app.rb")
      template('templates/Gemfile.erb', "#{name}/Gemfile")
      inside(name) do
        run "bundle install"
      end
    end

    desc 'resource people', 'Create a new resource'
    def resource(resource_name)
      @resource_name = resource_name
      template('templates/resource.erb', "resources/#{resource_name}.rb")
    end
  end
end
