class AddTotaltoTransaction < ActiveRecord::Migration[5.2]
  def change
    add_monetize :transactions, :total, currency: {present: false}
  end
end
