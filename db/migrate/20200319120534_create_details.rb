class CreateDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :details do |t|
      t.text :information
      t.references :clothe, foreign_key: true
      t.timestamps
    end
  end
end
