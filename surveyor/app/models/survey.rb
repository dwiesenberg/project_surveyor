class Survey < ApplicationRecord
  has_many :questions
# may not need this:
  # accepts_nested_attributes_for :questions,
  #                               reject_if: :all_blank,
  #                               allow_destroy: true

  has_many :responses
end
