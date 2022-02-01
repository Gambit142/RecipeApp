class Inventory < ApplicationRecord
  belongs_to :user
  has_many :foods_inventories
  has_many :foods, through: :foods_inventories

  validates :name, presence: true, length: { maximum: 250 }
end
