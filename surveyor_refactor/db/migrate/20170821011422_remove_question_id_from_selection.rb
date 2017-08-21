class RemoveQuestionIdFromSelection < ActiveRecord::Migration[5.0]
  def change
    remove_column :selections, :question_id, :integer
  end
end
