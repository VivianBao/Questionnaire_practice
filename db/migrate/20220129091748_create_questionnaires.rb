class CreateQuestionnaires < ActiveRecord::Migration[6.0]
  def change
    create_table :questionnaires do |t|
      t.references :reviewer, null: false, index: true, foreign_key: { to_table: :users }
      t.references :reviewee, null: false, index: true, foreign_key: { to_table: :users }
      t.string :name

      t.timestamps
    end
  end
end
