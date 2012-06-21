class ResourcePeriod < ActiveRecord::Base
  attr_accessible :length, :resource_id, :skip_duration, :start_time
  
  belongs_to :resource
  
  validates :length, :resource_id, :skip_duration, :start_time, :presence => true
  
end
