class RenameExripyDateColumnToFoods < ActiveRecord::Migration[5.2]
  def change
  	rename_column :foods, :exripy_date, :expiry_date
  end
end
