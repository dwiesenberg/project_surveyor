class Response < ApplicationRecord
  belongs_to :survey, optional: true, counter_cache: true
  belongs_to :option, optional: true, counter_cache: true
end

