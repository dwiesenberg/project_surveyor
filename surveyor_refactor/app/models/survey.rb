class Survey < ApplicationRecord

  has_many :questions, dependent: :delete_all
  accepts_nested_attributes_for :questions,
                                 reject_if: :all_blank,
                                 allow_destroy: true

  has_many :responses, dependent: :delete_all

  validates :title, presence: true
  validates :description, presence: true

end

