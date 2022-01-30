class RemoveForeignKeyOnResponses < ActiveRecord::Migration[6.0]
  def change
    remove_foreign_key :responses, :question_options
  end
end
