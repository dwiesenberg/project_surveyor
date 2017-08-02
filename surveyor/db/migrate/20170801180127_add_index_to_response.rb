class AddIndexToResponse < ActiveRecord::Migration[5.0]
  def change
    add_index :responses, :choice_id
  end
end


