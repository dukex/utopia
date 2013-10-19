require 'thor'

module UtopiaData
  class CLI < Thor
    include Thor::Actions

    def self.source_root
      File.expand_path('../../..', __FILE__)
    end

    desc "new project_name", "Create a new utopia"
    def new(name)
      directory('templates', name, verbose: true)
    end
  end
end
