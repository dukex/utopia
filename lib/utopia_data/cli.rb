require 'thor'
require 'active_support/inflector'

module UtopiaData
  class CLI < Thor
    include Thor::Actions

    def self.source_root
      File.expand_path('../../..', __FILE__)
    end

    desc "new project_name", "Create a new utopia"
    def new(name)
      @name = name
      directory('templates/app', name, verbose: true)
      template('templates/app.erb', "#{name}/#{name}_app.rb")
      template('templates/config.ru.erb', "#{name}/config.ru")
    end

    private
    def name
      @name
    end
  end
end
