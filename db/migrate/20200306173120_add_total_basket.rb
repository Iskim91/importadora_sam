class AddTotalBasket < ActiveRecord::Migration[5.2]
  def change
    add_monetize :baskets, :total, currency: {present: false}
  end
end
