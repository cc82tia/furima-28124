class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name,                null: false
      t.text :description,           null: false
      t.integer :condition_id,       null: false
      t.integer :delivery_charge_id,   null: false
      t.integer :delivery_source_id, null: false
      t.integer :days_of_ships_id,   null: false
      t.integer :price,              null: false
      t.integer :user_id,            null: false, foreign_key: true
      t.integer :category_id,        null: false

      t.timestamps
    end
  end
end
