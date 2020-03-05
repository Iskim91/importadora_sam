class Addprices < ActiveRecord::Migration[5.2]
  def change
    add_monetize :clothes, :price, currency: { present: false}
  end
end
