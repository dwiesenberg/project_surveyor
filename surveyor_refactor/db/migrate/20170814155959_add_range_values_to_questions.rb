class AddRangeValuesToQuestions < ActiveRecord::Migration[5.0]
  def change
    add_column  :questions, :minimum_range_value, :integer, 
                default: 0, null: false
    add_column  :questions, :maximum_range_value, :integer, 
                default: 0, null: false
  end
end
