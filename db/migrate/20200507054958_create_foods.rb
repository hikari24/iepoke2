class CreateFoods < ActiveRecord::Migration[5.2]
  def change
    create_table :foods do |t|
    	  t.integer :user_id,        null: false, foreign_key: true
        t.integer :category_id,    null: false, foreign_key: true
        t.string :name,            null: false
        t.string :quantity,        null: false
        t.datetime :purchase_date, null: false, default: DateTime.now
        t.datetime :exripy_date,   null: false, default: DateTime.now
        t.boolean :wish_list, null: false, default: false

      t.timestamps
    end
  end
end
