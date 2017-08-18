class Survey < ActiveRecord::Base
  has_many :questions
  has_many :multiple_choices, through: :questions
  has_many :range_choices, through: :questions
end
