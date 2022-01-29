class Questionnaire < ApplicationRecord
  belongs_to :sender, class_name: 'User', foreign_key: 'reviewer_id'
  belongs_to :recipient, class_name: 'User', foreign_key: 'reviewee_id'
  has_many :questions, dependent: :destroy
end
