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

    @planer_next_week = Weeklyplaner.all.order(id: :desc).limit(1).offset(1).first
    if @planer_next_week.created_at.to_date.cweek + 1 != Date.today.cweek + 1
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

    # 🔥 Das hier war außerhalb – jetzt korrekt drin!
    if @planer_this_week
      recipe_ids = [
        @planer_this_week.monday_recipe_id,
        @planer_this_week.tuesday_recipe_id,
        @planer_this_week.wednesday_recipe_id,
        @planer_this_week.thursday_recipe_id,
        @planer_this_week.friday_recipe_id,
        @planer_this_week.satureday_recipe_id,
        @planer_this_week.sunday_recipe_id
      ].compact

      recipe_counts = recipe_ids.tally
      amounts = Amount
        .where(recipe_id: recipe_counts.keys)
        .includes(:ingredient)

      ingredients_hash = {}

      amounts.each do |amount|
        key = [amount.ingredient.name, amount.einheit]
        menge = amount.mengen * recipe_counts[amount.recipe_id]

        if ingredients_hash[key]
          ingredients_hash[key] += menge
        else
          ingredients_hash[key] = menge
        end
      end

      # Erstellen eines Arrays von Hashes für die View
      @ingredients = ingredients_hash.map do |(name, einheit), total_menge|
        { name: name, einheit: einheit, total_menge: total_menge }
      end
    else
      @ingredients = []
    end
  end
end