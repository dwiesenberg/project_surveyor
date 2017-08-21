class RemoveQuestionIdOptionIdFromResponse < ActiveRecord::Migration[5.0]
  def change
    remove_column :responses, :question_id, :integer
    remove_column :responses, :option_id, :integer
  end
end
