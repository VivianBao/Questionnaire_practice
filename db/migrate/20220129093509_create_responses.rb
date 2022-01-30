class CreateResponses < ActiveRecord::Migration[6.0]
  def change
    create_table :responses do |t|
      t.integer :response_type
      t.string :response_text

      t.timestamps
    end
  end
end
