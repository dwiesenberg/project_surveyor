class CreateResponses < ActiveRecord::Migration[5.0]
  def change
    create_table :responses do |t|
      t.integer :survey_id

      t.timestamps
    end
  end
end
