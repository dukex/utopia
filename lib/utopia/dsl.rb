module Utopia

  #
  # The Utopia DSL. This class is where all the registration blocks
  # are instance eval'd. This is the central place for the API given to
  # users of Utopia
  #
  class DSL
    # Runs the registration block inside this object
    def run_registration_block(config, &block)
      @config = config
      instance_eval &block if block_given?
    end

    private

    # The instance of Utopia::Config that's being registered
    # currently. You can use this within your registration blocks to
    # modify options:
    #
    # eg:
    #
    #   Utopia.register :post do
    #     config.table_name = "por22"
    #   end
    #
    def config
      @config
    end

  end
end