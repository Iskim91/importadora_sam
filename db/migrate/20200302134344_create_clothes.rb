class CreateClothes < ActiveRecord::Migration[5.2]
  def change
    create_table :clothes do |t|
      t.string :name
      t.integer :price
      t.text :description
      t.string :category

      t.timestamps
    end
  end
end
