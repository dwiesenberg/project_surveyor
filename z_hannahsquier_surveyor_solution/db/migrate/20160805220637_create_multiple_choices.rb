class CreateMultipleChoices < ActiveRecord::Migration
  def change
    create_table :multiple_choices do |t|
      t.string :choice
      t.references :question, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
