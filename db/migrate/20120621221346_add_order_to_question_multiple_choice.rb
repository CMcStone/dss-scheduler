class AddOrderToQuestionMultipleChoice < ActiveRecord::Migration
  def change
    add_column :question_multiple_choices, :order, :integer
  end
end
