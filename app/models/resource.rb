class Resource < ActiveRecord::Base
  attr_accessible :name, :category_id, :description, :exchange_url, :ou_uid, :week_field, :start_time, :end_time, :instructions, :role_required, :allow_public, :questions_attributes
  
  has_many :reservations
  belongs_to :resource_category
  has_one :resource_period
  has_many :questions
  accepts_nested_attributes_for :questions

  #validates :name, :description, :exchange_url, :week_field, :start_time, :end_time, :allow_public, :presence => true
  
end
