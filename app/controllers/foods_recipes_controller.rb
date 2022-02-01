class FoodsRecipesController < ApplicationController
  def edit
    # TODO: authorize! :edit, @post
    @food_recipe = FoodsRecipe.find(params[:id])
  end

  def update
    # TODO: authorize! :edit, @post
    food_recipe = FoodsRecipe.find(params[:id])
    food_recipe.update!(foods_recipe_params)
    p food_recipe
    redirect_to recipe_url(food_recipe)
    puts "\n" * 10
    puts params
  end

  def destroy; end

  private

  def foods_recipe_params
    params.require(:foods_recipe).permit(:quantity)
  end
end
