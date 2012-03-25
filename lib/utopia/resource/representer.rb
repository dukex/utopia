require 'roar/representer/json'
require 'roar/representer/feature/hypermedia'

module Utopia
  class Resource
    module Representer
      def create_resource_representer
        representer_module = <<-MODEL
          module ::#{model_name}Representer
            include Roar::Representer::JSON
            include Roar::Representer::Feature::Hypermedia

            #{columns.map{|c| "property :#{c}" }.join("\n")}
          end
        MODEL
        eval representer_module
      end
    end
  end
end