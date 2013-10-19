module UtopiaData
  class Resource
    # TODO: TEST
    def initialize(resource_name, options = {}, &block)
      @name = resource_name
      #parse_registration_block(self, &block) if block_given?
      # @options = options
      create!
    end

    private
      def resource_dsl
      #  @resource_dsl ||= ResourceDSL.new
      end


      def parse_registration_block(the_resource, &block)
      #  resource_dsl.run_registration_block(the_resource, &block)
      end

      def create!
        resources = <<-RESOURCES
          resource :#{@name} do
            get do
              []
            end

            get ':id' do
              {}
            end
          end
       RESOURCES
       Api.class_eval resources
      end
  end
end
