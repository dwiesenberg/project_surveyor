class Question < ApplicationRecord

  has_many :options, inverse_of: :question, 
                     dependent: :delete_all
  accepts_nested_attributes_for :options,
                                allow_destroy: true

  belongs_to :survey

  validates :question_type, 
            inclusion: {in: ["Multiple Choice", "Number Range"]}

  validates :minimum_range_value, on: :update, 
            numericality: { less_than_or_equal_to: :maximum_range_value }

  validates :number_of_choices, on: :update,
            numericality: 
            {greater_than_or_equal_to: 2, less_than_or_equal_to: 5}

  validates :name, presence: true, on: :update_options

  # validates :required, presence: true, on: :update

  # validates :multiple_responses, presence: true, on: :update

  # lines 22 & 25 gives false negatives ... don't know why

  # line 20 doesn't work ... maybe doesn't recognize :update_options (but only :create and :update)

end
