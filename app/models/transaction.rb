class Transaction < ApplicationRecord
  belongs_to :user
  belongs_to :clothe
  belongs_to :basket
  SIZE = %w[XS S M L XL XXL]
  validates :quantity, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :color, presence: true
  validates :size, presence: true, inclusion: { in: SIZE }
  monetize :amount_cents, presence: true
  monetize :total_cents
end
