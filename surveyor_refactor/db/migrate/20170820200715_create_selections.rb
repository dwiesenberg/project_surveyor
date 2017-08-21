class CreateSelections < ActiveRecord::Migration[5.0]
  def change
    create_table :selections do |t|
      t.references :survey, foreign_key: true
      t.references :option, foreign_key: true
      t.integer :question_id

      t.timestamps
    end
  end
end
