class FoodsRecipesController < ApplicationController
  def edit
    # TODO: authorize! :edit, @post
    @food_recipe = current_food_recipe
  end

  def update
    # TODO: authorize! :edit, @post
    food_recipe = current_food_recipe
    food_recipe.update!(foods_recipe_params)
    redirect_to recipe_url(food_recipe.recipe_id)
    puts params
  end

  def destroy
    food_recipe = current_food_recipe
    food_recipe.destroy!
    redirect_to recipe_url(food_recipe.recipe_id)
  end

  private

  def current_food_recipe
    FoodsRecipe.find(params[:id])
  end

  def foods_recipe_params
    params.require(:foods_recipe).permit(:quantity)
  end
end
