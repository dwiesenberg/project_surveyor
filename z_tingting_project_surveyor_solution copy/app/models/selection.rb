class Selection < ApplicationRecord
  belongs_to :response, inverse_of: :selections
end
