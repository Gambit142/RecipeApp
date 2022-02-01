class FoodsController < ApplicationController
  def index
    @food = Food.first
  end

  def new; end

  def create; end

  def destroy; end
end
