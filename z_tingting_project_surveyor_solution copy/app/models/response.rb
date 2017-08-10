class Response < ApplicationRecord
  belongs_to :survey
  has_many :selections, inverse_of: :response
  accepts_nested_attributes_for :selections, :reject_if => :all_blank,
                                             :allow_destroy => :true
end
