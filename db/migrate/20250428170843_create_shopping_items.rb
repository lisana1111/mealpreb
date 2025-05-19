class CreateShoppingItems < ActiveRecord::Migration[8.0]
  def change
    create_table :shopping_items do |t|
      t.string :name
      t.string :einheit
      t.float :total_menge
      t.boolean :done
      t.references :weeklyplaner, null: false, foreign_key: true

      t.timestamps
    end
  end
end
