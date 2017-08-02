class CreateQuestions < ActiveRecord::Migration[5.0]
  def change
    create_table :questions do |t|
      t.string :question_test
      t.string :question_type
      t.boolean :required
      t.boolean :multiple_option
      t.references :survey, foreign_key: true

      t.timestamps
    end
  end
end
