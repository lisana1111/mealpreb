class Weeklyplaner < ApplicationRecord
  belongs_to :monday_recipe, class_name: "Recipe", optional: true
  belongs_to :tuesday_recipe, class_name: "Recipe", optional: true
  belongs_to :wednesday_recipe, class_name: "Recipe", optional: true
  belongs_to :thursday_recipe, class_name: "Recipe", optional: true
  belongs_to :friday_recipe, class_name: "Recipe", optional: true
  belongs_to :satureday_recipe, class_name: "Recipe", optional: true
  belongs_to :sunday_recipe, class_name: "Recipe", optional: true  

end
