class Resource < ActiveRecord::Base

  attr_accessible :name, :category_id, :description, :exchange_calendar_id, :ou_uid, :week_field, :start_time, :end_time, :instructions, :role_required, :allow_public, :questions_attributes

  
  has_many :reservations
  belongs_to :resource_category
  has_one :resource_period
  has_many :questions
  
  validates :name, :description, :exchange_calendar_id, :week_field, :start_time, :end_time, :presence => true
  validates_inclusion_of :allow_public, :in => [true, false]
  accepts_nested_attributes_for :questions

  
end
