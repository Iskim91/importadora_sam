class Clothe < ApplicationRecord
  # belongs_to :users
  has_many_attached :photos
  has_many :transactions
  validates :name, presence: true
  validates :description, presence: true, length: { minimum: 20 }
  validates :price, presence: true
  CATEGORY = ["T-Shirt", "Shirt", "Pants", "Dress"]
  SIZE = %w[XS S M L XL XXL]
  GENDER = %w[Men Women Unisex]
  validates :category, presence: true, inclusion: { in: CATEGORY }
  validates :size, inclusion: { in: SIZE }
  validates :gender, inclusion: { in: GENDER }
end
