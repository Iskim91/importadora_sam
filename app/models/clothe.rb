class Clothe < ApplicationRecord
  has_and_belongs_to_many :colors
  has_many_attached :photos
  has_many :transactions
  has_many :details, dependent: :destroy
  validates :name, presence: true
  validates :description, presence: true, length: { minimum: 20 }
  validates :price, presence: true

  CATEGORY = ["T-Shirt", "Shirt", "Pants", "Dress", "Top", "Outer", "Suit", "Sweater", "Sale"]
  GENDER = %w[Men Women Unisex]
  validates :category, presence: true, inclusion: { in: CATEGORY }
  validates :gender, inclusion: { in: GENDER }
  monetize :price_cents

  include PgSearch::Model
  pg_search_scope :search_by_name_gender_and_category,
    against: [ :name, :gender, :category ],
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }
end
