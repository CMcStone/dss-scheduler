class CreateQuestionResponses < ActiveRecord::Migration
  def change
    create_table :question_responses do |t|
      t.integer :question_id
      t.integer :reservation_id
      t.string :value

      t.timestamps
    end
  end
end
