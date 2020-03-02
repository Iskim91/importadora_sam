class Clothe < ApplicationRecord
  # belongs_to :users
  has_many :transactions
  validates :name, presence: true
  validates :description, presence: true, length: { minimum: 20 }
  validates :price, presence: true
  CATEGORY = ["T-Shirt", "Shirt", "Pants", "Dress"]
  validates :category, presence: true, inclusion: { in: CATEGORY }
end
