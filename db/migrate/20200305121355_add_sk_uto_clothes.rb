class AddSkUtoClothes < ActiveRecord::Migration[5.2]
  def change
    add_column :clothes, :sku, :string
  end
end
