class AddforeignKeyToReponses < ActiveRecord::Migration[6.0]
  def change
    add_reference :responses, :report, foreign_key: true
  end
end
