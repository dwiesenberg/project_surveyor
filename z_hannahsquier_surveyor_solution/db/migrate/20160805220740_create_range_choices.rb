class CreateRangeChoices < ActiveRecord::Migration
  def change
    create_table :range_choices do |t|
      t.integer :min
      t.integer :max
      t.references :question, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
