class ShoppingItemsController < ApplicationController
  # Setzt das ShoppingItem-Objekt für show, update und destroy
  before_action :set_shopping_item, only: [:show, :update, :destroy]
  
  # Setzt das Weeklyplaner-Objekt für create
  before_action :set_weeklyplaner, only: [:create]

  # Artikel anzeigen
  def show
    # @shopping_item wird durch before_action gesetzt
  end

  # Artikel erstellen
  def create
    # Erstelle ein neues ShoppingItem und verknüpfe es mit dem Weeklyplaner
    @shopping_item = @weeklyplaner.shopping_items.create(shopping_item_params)

    if @shopping_item.save
      redirect_to root_path, notice: 'Shopping Item was successfully created.'
    else
      redirect_to root_path, alert: 'Failed to create Shopping Item.'
    end
  end

  # Artikel bearbeiten (Menge ändern, abgehakt setzen)
  def update
    if @shopping_item.update(shopping_item_params)
      redirect_to root_path, notice: 'Shopping Item was successfully updated.'
    else
      render :edit
    end
  end

  # Artikel löschen
  def destroy
    @shopping_item.destroy
    redirect_to root_path, notice: 'Shopping Item was successfully destroyed.'
  end

  private

  # Setzt das ShoppingItem-Objekt für show, update und destroy
  def set_shopping_item
    @shopping_item = ShoppingItem.find(params[:id])
  end

  # Setzt das Weeklyplaner-Objekt für create
  def set_weeklyplaner
    @weeklyplaner = Weeklyplaner.find(params[:weeklyplaner_id])
  end

  # Strong parameters für ShoppingItem
  def shopping_item_params
    params.require(:shopping_item).permit(:done, :name, :einheit, :total_menge )  # Kann auch 'name' oder andere Parameter beinhalten
  end
end
