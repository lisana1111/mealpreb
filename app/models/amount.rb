class Amount < ApplicationRecord
  #validates :einheit
  #validates :mengen
  belongs_to :ingredient
  belongs_to :recipe

  def self.summed_ingredients
    joins(:ingredient)
      .select("ingredient_id, ingredients.name, SUM(menge) as total_menge, einheit")
      .group("ingredient_id, ingredients.name, einheit")
  end
end
