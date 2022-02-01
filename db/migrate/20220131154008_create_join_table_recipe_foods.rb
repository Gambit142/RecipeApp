class CreateJoinTableRecipeFoods < ActiveRecord::Migration[6.1]
  def change
    create_join_table :recipes, :foods do |t|
      t.index :food_id
      t.index :recipe_id
      t.integer :quantity

      t.timestamps
    end
  end
end
