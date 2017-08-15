class CreateResponses < ActiveRecord::Migration[5.0]
  def change
    create_table :responses do |t|
      t.references :question, foreign_key: true
      t.references :option, foreign_key: true

      t.timestamps
    end
    add_index :responses, [:question_id, :option_id]
  end
end

