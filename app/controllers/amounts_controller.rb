class AmountsController < ApplicationController
  def create
    #id von routes, weil wir innerhalb vom Rezept sind aber auf Amount kann man es nicht mehr nur "id" nennen sonder "recipe_id"
    @recipe = Recipe.find(params[:recipe_id])
    @amount = @recipe.amounts.build(amount_params)
    if @amount.save
      redirect_to @recipe
    else
      debugger
    end
  end

  def destroy
    @recipe = Recipe.find(params[:recipe_id])
    @amount = @recipe.amounts.find(params[:id])

    #Amount.find_by(recipe_id: params[:recipe_id], id: params[:id])
    @amount.destroy

    redirect_to @recipe, status: :see_other
  end

  def shopping_list
    @planer_this_week = Plan.find(params[:plan_id]) # Plan-ID aus der URL holen

    # Alle Rezepte aus dem Plan holen
    recipe_ids = @planer_this_week.recipes.pluck(:id)

    # Summierte Zutaten abrufen
    @ingredients = Amount.where(recipe_id: recipe_ids).summed_ingredients
  end

  private
  
  def amount_params
      params.expect(amount: [:ingredient_id, :mengen, :einheit ])
  end
end