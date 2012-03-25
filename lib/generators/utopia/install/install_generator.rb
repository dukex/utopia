module Utopia
  class InstallGenerator < Rails::Generators::NamedBase
    source_root File.expand_path('../../templates', __FILE__)
    argument :name, :default => ""

    def copy_initializer
      template 'initializer.rb.erb', 'config/initializers/utopia.rb'
    end

    def setup_routes
      route "Utopia.routes(self)"
    end
  end
end