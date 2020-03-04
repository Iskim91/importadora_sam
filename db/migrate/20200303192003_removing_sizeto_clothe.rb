class RemovingSizetoClothe < ActiveRecord::Migration[5.2]
  def change
    remove_column :clothes, :size
  end
end
