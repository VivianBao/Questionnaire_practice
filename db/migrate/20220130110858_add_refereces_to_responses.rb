class AddReferecesToResponses < ActiveRecord::Migration[6.0]
  def change
    add_reference :responses, :subcategory, foreign_key: true
  end
end
