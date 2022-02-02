class Recipe < ApplicationRecord
  belongs_to :user
  has_many :foods_recipes, dependent: :destroy
  has_many :foods, through: :foods_recipes

  validates :name, presence: true, length: { maximum: 250 }
  validates :description, presence: true, length: { maximum: 1000 }
  validates :public, presence: true, inclusion: [true, false]

  def add_ingredient(food, quantity)
    already_exists = foods.find_by(name: food.name)
    foods_recipes.create!(food: food, quantity: quantity) unless already_exists
  end
end
