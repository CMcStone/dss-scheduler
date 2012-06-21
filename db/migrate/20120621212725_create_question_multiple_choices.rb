class CreateQuestionMultipleChoices < ActiveRecord::Migration
  def change
    create_table :question_multiple_choices do |t|
      t.integer :question_id
      t.string :value

      t.timestamps
    end
  end
end
