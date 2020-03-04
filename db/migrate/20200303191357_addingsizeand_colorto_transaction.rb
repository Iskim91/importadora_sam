class AddingsizeandColortoTransaction < ActiveRecord::Migration[5.2]
  def change
    add_column :transactions, :size, :string
    add_column :transactions, :quantity, :integer
    add_column :transactions, :color, :string
    add_column :transactions, :status, :string, default: "pending"
  end
end
