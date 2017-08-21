class RenameResponsesCountToSelectionsCount < ActiveRecord::Migration[5.0]
  def change
    rename_column :options, :responses_count, :selections_count
  end
end
