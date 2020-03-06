class Transaction < ApplicationRecord
  belongs_to :user
  belongs_to :clothe
  belongs_to :basket
  SIZE = %w[XS S M L XL XXL]
  validates :quantity, presence: true
  validates :color, presence: true
  validates :size, presence: true, inclusion: { in: SIZE }
  monetize :amount_cents
  monetize :total_cents
end
