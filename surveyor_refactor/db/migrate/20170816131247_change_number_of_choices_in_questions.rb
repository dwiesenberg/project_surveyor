class ChangeNumberOfChoicesInQuestions < ActiveRecord::Migration[5.0]
  def change
    change_column :questions, :number_of_choices, :integer, default: 2
  end
end
