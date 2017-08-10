class RenameChoicesToChoicesTotalInQuestion < ActiveRecord::Migration[5.0]
  def change
    rename_column :questions, :choices, :choices_total
  end
end



