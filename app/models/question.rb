class Question < ActiveRecord::Base
  attr_accessible :is_multiple_choice, :order, :question, :resource_id
  
  belongs_to :resource
  has_many :question_multiple_choices
  
  validates :is_multiple_choice, :order, :question, :resource_id, :presence => true
end
