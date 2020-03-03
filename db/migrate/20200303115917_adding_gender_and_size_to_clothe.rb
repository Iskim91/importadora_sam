class AddingGenderAndSizeToClothe < ActiveRecord::Migration[5.2]
  def change
    add_column :clothes, :size, :string
    add_column :clothes, :gender, :string
  end
end
