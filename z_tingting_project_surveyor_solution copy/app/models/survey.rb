class Survey < ApplicationRecord
  has_many :questions
  has_many :responses
  accepts_nested_attributes_for :questions, :reject_if => :all_blank, 
                                          :allow_destroy => true
end
