class Subcategory < ApplicationRecord
  belongs_to :category
  has_many :traits, dependent: :destroy
end
