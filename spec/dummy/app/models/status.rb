class Status < ActiveRecord::Base
  belongs_to :lei
  attr_accessible :name
end
