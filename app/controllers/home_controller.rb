class HomeController < ApplicationController
 
  def index 
    @planer = Weeklyplaner.last
    if  @planer.created_at.to_date.cweek != Date.today.cweek
      @planer = Weeklyplaner.create
      recipesample = Recipe.all.sample(7)
      @planer.monday_recipe = recipesample[0]
      @planer.tuesday_recipe = recipesample[1]
      @planer.wednesday_recipe = recipesample[2]
      @planer.thursday_recipe = recipesample[3]
      @planer.friday_recipe = recipesample[4]
      @planer.satureday_recipe = recipesample[5]
      @planer.sunday_recipe = recipesample[6]
      @planer.save
    end 
    
    @planer = Weeklyplaner.last
    if  @planer.created_at.to_date.cweek+1 != Date.today.cweek
      @planer = Weeklyplaner.create
      recipesample = Recipe.all.sample(7)
      @planer.monday_recipe = recipesample[0]
      @planer.tuesday_recipe = recipesample[1]
      @planer.wednesday_recipe = recipesample[2]
      @planer.thursday_recipe = recipesample[3]
      @planer.friday_recipe = recipesample[4]
      @planer.satureday_recipe = recipesample[5]
      @planer.sunday_recipe = recipesample[6]
      @planer.save
    end 


  end

#Sonntag 23:59 soll ein neuer Plan erstellt werden. Zu jeder anderen Zeit soll der vorhandene supertolle perfekte Wochen-Mealpreb-Plan angezeigt werden.
end