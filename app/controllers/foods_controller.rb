class FoodsController < ApplicationController
  def index
    @foods = current_user.foods
  end

  def new; end

  def create; end

  def destroy; end
end
