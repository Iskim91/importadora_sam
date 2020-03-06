class Referenceclothe < ActiveRecord::Migration[5.2]
  def change
    add_reference :transactions, :clothe, foreign_key: true
  end
end
