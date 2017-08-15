class CreateQuestions < ActiveRecord::Migration[5.0]
  def change
    create_table :questions do |t|
      t.string :name
      t.string :question_type
      t.integer :number_of_choices
      t.boolean :multiple_responses
      t.boolean :required
      t.references :survey, foreign_key: true

      t.timestamps
    end
  end
end
