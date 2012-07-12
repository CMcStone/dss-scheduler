class Reservation < ActiveRecord::Base
  attr_accessible :title, :description, :cache_end_time, :cache_start_time, :exchange_event_id, :package_id, :person_id, :questionnaire_response_id, :recurrence_id, :resource_id
  
  validates :person_id, :resource_id, :cache_start_time, :cache_end_time, :presence => true
  
  belongs_to :resource
  belongs_to :person
  has_many :questions

  # need to override the json view to return what full_calendar is expecting.
  # http://arshaw.com/fullcalendar/docs/event_data/Event_Object/
  def as_json(options = {})
    {
      :id => self.id,
      :title => self.person_id.to_s,
      :description => self.exchange_event_id,
      :start => self.cache_start_time,
      :end => self.cache_end_time,
      :allDay => false,
      :recurring => false,
      :url => Rails.application.routes.url_helpers.reservation_path(id)
    }
    
  end
  
  def self.format_date(date_time)
    Time.at(date_time.to_i).to_formatted_s(:db)
  end
end
