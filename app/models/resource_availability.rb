class ResourceAvailability < ActiveRecord::Base
  attr_accessible :length, :resource_id, :skip_duration, :start_time
end
