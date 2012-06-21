class Reservation < ActiveRecord::Base
  attr_accessible :cache_end_time, :cache_start_time, :exchange_event_id, :package_id, :person_id, :questionnaire_response_id, :recurrence_id, :resource_id
  
  belongs_to :resource
  belongs_to :person
  has_many :questions
end
