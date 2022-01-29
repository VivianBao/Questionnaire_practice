class ChangeQuestionTypeToQuestions < ActiveRecord::Migration[6.0]
  def change
    change_column :questions, :question_type, :integer
  end
end
