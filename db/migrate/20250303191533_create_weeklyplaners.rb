class CreateWeeklyplaners < ActiveRecord::Migration[8.0]
  def change
    create_table :weeklyplaners do |t|
      t.string :title
      t.references :monday_recipe, null: true, foreign_key: {to_table: :recipes}
      t.references :tuesday_recipe, null: true, foreign_key: {to_table: :recipes}
      t.references :wednesday_recipe, null: true, foreign_key: {to_table: :recipes}
      t.references :thursday_recipe, null: true, foreign_key: {to_table: :recipes}
      t.references :friday_recipe, null: true, foreign_key: {to_table: :recipes}
      t.references :satureday_recipe, null: true, foreign_key: {to_table: :recipes}
      t.references :sunday_recipe, null: true, foreign_key: {to_table: :recipes}

      t.timestamps
    end
  end
end
