class Report < ApplicationRecord
  belongs_to :questionnaire
  has_many :responses, inverse_of: :report
  accepts_nested_attributes_for :responses
end
