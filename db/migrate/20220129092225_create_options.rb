class CreateOptions < ActiveRecord::Migration[6.0]
  def change
    create_table :options do |t|
      t.belongs_to :question
      t.string :option_type
      t.string :option_text

      t.timestamps
    end
  end
end
