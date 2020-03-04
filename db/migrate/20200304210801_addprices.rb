class Addprices < ActiveRecord::Migration[5.2]
  def change
    add_monetize :clothes, :price, currenct: { present: false}
  end
end
