class ResourceCategory < ActiveRecord::Base
  attr_accessible :name
  
  has_many :resources
  
  validates :name, :presence => true
end
