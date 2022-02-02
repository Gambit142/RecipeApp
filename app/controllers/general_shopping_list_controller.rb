class GeneralShoppingListController < ApplicationController
  # load_and_authorize_resource
  def index
    foods = Food.joins :ingredients, :foods_inventories
    list_items = foods.pluck('foods_inventories.quantity, foods_recipes.quantity, foods.name, foods.price')
    @missing_items = list_items.select do |list_item|
      list_item[0] < list_item[1]
    end
  end
end
