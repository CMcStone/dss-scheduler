class QuestionMultipleChoice < ActiveRecord::Base
  attr_accessible :question_id, :value
  
  belongs_to :question
end
