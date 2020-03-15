class CreateClothesColors < ActiveRecord::Migration[5.2]
  def change
    create_table :clothes_colors, id: false do |t|
      t.references :clothe, foreign_key: true
      t.references :color, foreign_key: true

      t.timestamps
    end
  end
end
