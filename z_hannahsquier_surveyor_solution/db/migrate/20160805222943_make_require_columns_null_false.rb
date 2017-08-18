class MakeRequireColumnsNullFalse < ActiveRecord::Migration
  def change

    change_column :multiple_choices, :choice, :string, null: false
    change_column :questions, :question, :string, null: false

    change_column :questions, :type, :string, null: false

    change_column :questions, :required, :boolean, null: false

    change_column :range_choices, :min, :integer, null: false

    change_column :range_choices, :max, :integer, null: false

    change_column :surveys, :title, :string, null: false
  end
end
