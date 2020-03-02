class Transaction < ApplicationRecord
  belongs_to :user
  belongs_to :clothe
end
