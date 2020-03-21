class AddPublishToClothes < ActiveRecord::Migration[5.2]
  def change
    add_column :clothes, :publish, :boolean, default: false
  end
end
