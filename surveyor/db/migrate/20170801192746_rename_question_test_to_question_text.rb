class RenameQuestionTestToQuestionText < ActiveRecord::Migration[5.0]
  def change
    rename_column :questions, :question_test, :question_text
  end
end
