class Addreferencetotransaction < ActiveRecord::Migration[5.2]
  def change
    add_reference :transactions, :basket, foreign_key: true
  end
end
