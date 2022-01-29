class CreateResponses < ActiveRecord::Migration[6.0]
  def change
    create_table :responses do |t|
      t.belongs_to :question_option, null: false, foreign_key: true
      t.integer :response_type
      t.string :response_text

      t.timestamps
    end
  end
end
