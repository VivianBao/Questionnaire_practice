class CreateQuestionOptions < ActiveRecord::Migration[6.0]
  def change
    create_table :question_options do |t|
      t.belongs_to :question, null: false, foreign_key: true
      t.belongs_to :option, null: false, foreign_key: true

      t.timestamps
    end
  end
end
