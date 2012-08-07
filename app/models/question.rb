class Question < ActiveRecord::Base
  attr_accessible :is_multiple_choice, :order, :question, :resource_id, :question_responses_attributes
  
  belongs_to :resource
  has_many :question_multiple_choices
  has_many :question_responses
  
  accepts_nested_attributes_for :question_responses
  
  validates :is_multiple_choice, :order, :question, :resource_id, :presence => true
end
