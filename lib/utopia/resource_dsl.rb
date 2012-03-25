module Utopia
  # This is the class where all the register blocks are instance eval'd
  class ResourceDSL < DSL
    private

    def table_name(name)
      config.config[:table_name] = name
    end
  end
end