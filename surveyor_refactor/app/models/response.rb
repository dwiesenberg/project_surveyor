class Response < ApplicationRecord

  has_many :selections, inverse_of: :response, 
                        dependent: :delete_all
  accepts_nested_attributes_for :selections,
                                reject_if: :all_blank,
                                allow_destroy: true

  belongs_to :survey, optional: true, counter_cache: true

  validates :survey_id, presence: true

end
