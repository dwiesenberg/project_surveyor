class AddResponsesCountToSurveys < ActiveRecord::Migration[5.0]
  def change
    add_column  :surveys, :responses_count, :integer,
                default: 0, null: false
  end
end
