class Reservation < ActiveRecord::Base
  attr_accessible :title, :cache_end_time, :cache_start_time, :exchange_event_id, :package_id, :person_id, :questionnaire_response_id, :recurrence_id, :resource_id
  attr_writer :current_step
  
  validates :person_id, :resource_id, :cache_start_time, :cache_end_time, :presence => true
  
  belongs_to :resource
  belongs_to :person
  has_many :questions
  
  def current_step
    @current_step || steps.first
  end
  
  def steps
    %w[step1 step2 step3 step4]
  end
  
  def next_step
    self.current_step = steps[steps.index(current_step)+1]
  end

  def previous_step
    self.current_step = steps[steps.index(current_step)-1]
  end

  def first_step?
    current_step == steps.first
  end

  def last_step?
    current_step == steps.last
  end

  def all_valid?
    steps.all? do |step|
      self.current_step = step
      valid?
    end
  end

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
