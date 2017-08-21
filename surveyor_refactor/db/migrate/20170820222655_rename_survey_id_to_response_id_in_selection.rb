class RenameSurveyIdToResponseIdInSelection < ActiveRecord::Migration[5.0]
  def change
    rename_column :selections, :survey_id, :response_id
  end
end
