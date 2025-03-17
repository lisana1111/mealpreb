class HomeController < ApplicationController
 
  def index 
    @planer_this_week = Weeklyplaner.last
    if @planer_this_week.created_at.to_date.cweek != Date.today.cweek
      @planer_this_week = Weeklyplaner.create
      recipesample = Recipe.all.sample(7)
      @planer_this_week.monday_recipe = recipesample[0]
      @planer_this_week.tuesday_recipe = recipesample[1]
      @planer_this_week.wednesday_recipe = recipesample[2]
      @planer_this_week.thursday_recipe = recipesample[3]
      @planer_this_week.friday_recipe = recipesample[4]
      @planer_this_week.satureday_recipe = recipesample[5]
      @planer_this_week.sunday_recipe = recipesample[6]
      @planer_this_week.save
    end 
    
    @planer_next_week = Weeklyplaner.all.order(id: :desc).limit(1).offset(1).first # = Weeklyplaner.all[-2] gibt zweitletztes Element aus Array
    if @planer_next_week.created_at.to_date.cweek+1 != Date.today.cweek + 1
      @planer_next_week = Weeklyplaner.create
      recipesample = Recipe.all.sample(7)
      @planer_next_week.monday_recipe = recipesample[0]
      @planer_next_week.tuesday_recipe = recipesample[1]
      @planer_next_week.wednesday_recipe = recipesample[2]
      @planer_next_week.thursday_recipe = recipesample[3]
      @planer_next_week.friday_recipe = recipesample[4]
      @planer_next_week.satureday_recipe = recipesample[5]
      @planer_next_week.sunday_recipe = recipesample[6]
      @planer_next_week.save
    end 


  end

private
  def findplaner_for_this_week 

  end

#Sonntag 23:59 soll ein neuer Plan erstellt werden. Zu jeder anderen Zeit soll der vorhandene supertolle perfekte Wochen-Mealpreb-Plan angezeigt werden.
end