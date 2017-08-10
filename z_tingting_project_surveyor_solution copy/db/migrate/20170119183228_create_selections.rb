class CreateSelections < ActiveRecord::Migration[5.0]
  def change
    create_table :selections do |t|
      t.integer :response_id
      t.integer :question_id
      t.integer :option_id

      t.timestamps
    end
  end
end
