class AddReferenceToQuestions < ActiveRecord::Migration[6.0]
  def change
    add_reference :questions, :subcategory, foreign_key: true
  end
end
