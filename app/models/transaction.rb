class Transaction < ApplicationRecord
  belongs_to :user
  belongs_to :clothe
  SIZE = %w[XS S M L XL XXL]
  validates :quantity, presence: true
  validates :color, presence: true
  validates :size, presence: true, inclusion: { in: SIZE }
end
