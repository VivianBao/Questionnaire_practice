class AddReports < ActiveRecord::Migration[6.0]
  def change
    create_table :reports do |t|
      t.belongs_to :questionnaire, null: false, foreign_key: true
    end
  end
end
