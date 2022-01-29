class ChangeOptionTypeOfOptions < ActiveRecord::Migration[6.0]
  def change
    change_column :options, :option_type, :integer
  end
end
