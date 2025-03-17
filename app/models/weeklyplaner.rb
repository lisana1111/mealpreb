class Weeklyplaner < ApplicationRecord
  belongs_to :monday_recipe, class_name: "Recipe", optional: true
  belongs_to :tuesday_recipe, class_name: "Recipe", optional: true
  belongs_to :wednesday_recipe, class_name: "Recipe", optional: true
  belongs_to :thursday_recipe, class_name: "Recipe", optional: true
  belongs_to :friday_recipe, class_name: "Recipe", optional: true
  belongs_to :satureday_recipe, class_name: "Recipe", optional: true
  belongs_to :sunday_recipe, class_name: "Recipe", optional: true  

  def amounts
    monday_recipe.amounts + tuesday_recipe.amounts + wednesday_recipe.amounts + thursday_recipe.amounts + friday_recipe.amounts + satureday_recipe.amounts + sunday_recipe.amounts 
  end

end
