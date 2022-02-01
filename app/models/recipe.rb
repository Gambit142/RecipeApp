class Recipe < ApplicationRecord
  belongs_to :user
  has_many :recipe_foods
  has_many :foods, through: :recipe_foods

  validates :name, presence: true, length: { maximum: 250 }
  validates :description, presence: true, length: { maximum: 1000 }
  validates :public, presence: true, inclusion: [true, false]
end
