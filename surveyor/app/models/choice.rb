class Choice < ApplicationRecord
  has_many :responses
  belongs_to :question
end
