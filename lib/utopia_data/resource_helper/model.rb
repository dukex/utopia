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

require 'active_record'

module UtopiaData
  # @nodoc
  module ResourceHelper
    module Model
      def model
        @model ||= model_class
      end

      def create_model
        initialize_model
      end

      def model_class
        @model_class ||= ActiveSupport::Dependencies.constantize(model_name)
      end

      private

      def initialize_model
        model_class = <<-MODEL
          class ::#{model_name} < ActiveRecord::Base
          end
        MODEL

        eval model_class
      end

      def model_name
        name.to_s.classify
      end
    end
  end
end
