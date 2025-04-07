class WeeklyplanerController < ApplicationController
  
  def edit
    @weeklyplaner = Weeklyplaner.find(params[:id])
  end

  def update
    @weeklyplaner = Weeklyplaner.find(params[:id])

    if @weeklyplaner.update(weeklyplaner_params)
      redirect_to root_path
    else
      render :edit, status: :unprocessable_entity
    end
  end
  private
  def weeklyplaner_params
    params.expect(weeklyplaner: [ :title, :monday_recipe_id, :tuesday_recipe_id, :wednesday_recipe_id, :thursday_recipe_id, :friday_recipe_id, :satureday_recipe_id, :sunday_recipe_id])
  end
end