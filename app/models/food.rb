class Food < ApplicationRecord
  belongs_to :user
  has_many :foods_recipes
  has_many :foods_inventories
  has_many :recipes, through: :foods_recipes
  has_many :inventories, through: :foods_inventories

  validates :name, presence: true, length: { maximum: 250 }
  validates :measurement_unit, presence: true, length: { maximum: 20 }
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
end
