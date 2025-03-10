class HomeController < ApplicationController
 
  def index
    @planer = Weeklyplaner.first
    recipesample = Recipe.all.sample(7)
    @planer.monday_recipe = recipesample[0]
    @planer.tuesday_recipe = recipesample[1]
    @planer.wednesday_recipe = recipesample[2]
    @planer.thursday_recipe = recipesample[3]
    @planer.friday_recipe = recipesample[4]
    @planer.satureday_recipe = recipesample[5]
    @planer.sunday_recipe = recipesample[6]
  end 


end