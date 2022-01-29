class CreateQuestions < ActiveRecord::Migration[6.0]
  def change
    create_table :questions do |t|
      t.belongs_to :questionnaire, null: false, foreign_key: true
      t.string :question_type
      t.string :question_text
      t.boolean :active

      t.timestamps
    end
  end
end
