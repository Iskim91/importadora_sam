class Addsessiontobasket < ActiveRecord::Migration[5.2]
  def change
    add_monetize :baskets, :price, currency: { present: false}
    add_column :baskets, :checkout_session_id, :string
  end
end
