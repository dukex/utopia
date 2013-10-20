require 'bundler/setup'
require 'utopia_data'

UtopiaData.setup do
end


Dir['resources/**/*.rb'].each{ |resource| require File.expand_path(resource) }
