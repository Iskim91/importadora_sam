class RemoveClotheRefence < ActiveRecord::Migration[5.2]
  def change
    remove_column :baskets, :clothe_id
  end
end
