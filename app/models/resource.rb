class Resource < ActiveRecord::Base
  attr_accessible :allow_anonymous, :category_id, :description, :end_time, :exchange_url, :name, :ou_uid, :start_time, :week_field
  
  has_many :reservations
  belongs_to :resource_category
  has_one :resource_period
  has_many :questions
  
  validates :name, :description, :exchange_url, :week_field, :start_time, :end_time, :allow_anonymous, :presence => true
  
end
