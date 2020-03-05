class AddSkUtotransaction < ActiveRecord::Migration[5.2]
  def change
    add_column :transactions, :clothe_sku, :string
    add_monetize :transactions, :amount, currency: { present: false}
    add_column :transactions, :checkout_session_id, :string
  end
end
