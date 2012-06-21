class Question < ActiveRecord::Base
  attr_accessible :is_multiple_choice, :order, :question, :resource_id
  
  belongs_to :reservation
  has_many :question_multiple_choices
end
