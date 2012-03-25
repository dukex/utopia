require 'inherited_resources'

module Utopia
  class BaseController < ::InheritedResources::Base
    actions :index, :show
    respond_to :xml, :json#, :cvs
  end
end