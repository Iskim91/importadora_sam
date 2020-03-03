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


  include PgSearch::Model
  pg_search_scope :search_by_name_gender_and_category,
    against: [ :name, :gender, :category ],
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }
end
