class CreateBaskets < ActiveRecord::Migration[5.2]
  def change
    create_table :baskets do |t|
      t.string :status, default: "pending"
      t.references :user, foreign_key: true
      t.references :clothe, foreign_key: true
      t.timestamps
    end
  end
end
