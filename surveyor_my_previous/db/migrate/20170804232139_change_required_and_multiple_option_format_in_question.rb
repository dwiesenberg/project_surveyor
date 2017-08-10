class ChangeRequiredAndMultipleOptionFormatInQuestion < ActiveRecord::Migration[5.0]
  def change
    change_column :questions, :required, :text
    change_column :questions, :multiple_option, :text
  end
end

