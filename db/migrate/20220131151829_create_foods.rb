class CreateFoods < ActiveRecord::Migration[6.1]
  def change
    create_table :foods do |t|
      t.string :name
      t.numeric :measurement_unit
      t.numeric :price
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
