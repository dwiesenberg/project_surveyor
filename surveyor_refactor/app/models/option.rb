class Option < ApplicationRecord
  belongs_to :question, inverse_of: :options
  has_many :responses, dependent: :delete_all

  # validates :name, presence: true

  # error thrown up but error produced on render :edit_options
  # missing survey_id ... find out when time permits
end

