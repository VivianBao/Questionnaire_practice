class Report < ApplicationRecord
  belongs_to :questionnaire
  accepts_nested_attributes_for :responses
end
