class CreateAmounts < ActiveRecord::Migration[8.0]
  def change
    create_table :amounts do |t|
      t.belongs_to :recipe
      t.belongs_to :ingredient
      t.integer :mengen
      t.string :einheit

      t.timestamps
    end
  end
end
