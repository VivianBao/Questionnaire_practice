class Category < ApplicationRecord
  has_many :subcategorys, dependent: :destroy
end
