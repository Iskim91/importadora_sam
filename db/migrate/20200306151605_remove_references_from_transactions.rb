class RemoveReferencesFromTransactions < ActiveRecord::Migration[5.2]
  def change
    remove_column :transactions, :user_id
    remove_column :transactions, :clothe_id
  end
end
