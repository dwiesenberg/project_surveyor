class AddOptionToQuestion < ActiveRecord::Migration[5.0]
  def change
    add_column :questions, :choices, :integer
  end
end
