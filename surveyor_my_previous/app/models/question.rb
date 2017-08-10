class Question < ApplicationRecord

  has_many :choices, inverse_of: :question
  accepts_nested_attributes_for :choices,
                                :reject_if => :all_blank,
                                :allow_destroy => true;

  belongs_to :survey

end
