module Utopia
  class ResourceGenerator < Rails::Generators::NamedBase
    source_root File.expand_path('../../templates', __FILE__)

    def create_initializer_file
      template "resource.rb",  "app/resource/#{file_path.gsub('/', '_')}.rb"
    end
  end
end