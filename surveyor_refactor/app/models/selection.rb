class Selection < ApplicationRecord
  belongs_to :response, inverse_of: :selections
  belongs_to :option, optional: true, counter_cache: true

  validates :option_id, presence: true
  # validates :response_id, presence: true

end

