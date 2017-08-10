class ChangeRequiredAndMultipleOptionFormatInQuestionAgain < ActiveRecord::Migration[5.0]
  def change
    change_column :questions, :required, :string
    change_column :questions, :multiple_option, :string
  end
end
