class ResourceCategory < ActiveRecord::Base
  attr_accessible :name, :is_pool
  has_many :resources
  validates :name, :presence => true
end
