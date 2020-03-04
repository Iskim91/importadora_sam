class Removeprices < ActiveRecord::Migration[5.2]
  def change
    remove_column :clothes, :price
  end
end
