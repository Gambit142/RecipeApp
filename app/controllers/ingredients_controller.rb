class IngredientsController < ApplicationController
  def edit
    # TODO: authorize! :edit, @post
    @ingredient = current_ingredient
  end

  def update
    # TODO: authorize! :edit, @post
    ingredient = current_ingredient
    ingredient.update!(ingredient_params)
    redirect_to recipe_url(ingredient.recipe_id)
    puts params
  end

  def destroy
    ingredient = current_ingredient
    ingredient.destroy!
    redirect_to recipe_url(ingredient.recipe_id)
  end

  private

  def current_ingredient
    Ingredient.find(params[:id])
  end

  def ingredient_params
    params.require(:ingredient).permit(:quantity)
  end
end
