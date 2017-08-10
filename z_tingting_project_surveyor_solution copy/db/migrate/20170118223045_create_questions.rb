class CreateQuestions < ActiveRecord::Migration[5.0]
  def change
    create_table :questions do |t|
      t.string :content
      t.string :question_type
      t.integer :survey_id
      t.boolean :required
      t.integer :num_options
      t.boolean :one_selection

      t.timestamps
    end
  end
end
