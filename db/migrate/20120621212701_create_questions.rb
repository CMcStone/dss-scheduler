class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.integer :resource_id
      t.integer :order
      t.string :question
      t.boolean :is_multiple_choice

      t.timestamps
    end
  end
end
