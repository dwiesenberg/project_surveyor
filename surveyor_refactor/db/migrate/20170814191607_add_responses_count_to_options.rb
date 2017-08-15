class AddResponsesCountToOptions < ActiveRecord::Migration[5.0]
  def change
    add_column  :options, :responses_count, :integer,
                default: 0, null: false
  end
end
