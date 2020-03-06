class Basket < ApplicationRecord
  has_many :transactions, dependent: :destroy
  has_many :clothes
  belongs_to :user
  monetize :total_cents
end
