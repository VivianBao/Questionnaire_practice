class Question < ApplicationRecord
  belongs_to :questionnaire
  belongs_to :subcategory
  # has_many :options, dependent: :destroy
  enum status: { score: 0, multiple: 1 }
end
