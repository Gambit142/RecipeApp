class RecipesController < ApplicationController
  load_and_authorize_resource
  def create; end

  def new; end

  def index
    @recipes = Recipe.where(user: current_user)
  end

  def show; end

  def destroy
    @recipe.destroy!
    flash[:notice] = 'Deleted Recipe!'
    redirect_to recipes_url
  end

  def public_recipes; end
end
