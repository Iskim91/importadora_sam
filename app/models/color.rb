class Color < ApplicationRecord
  has_and_belongs_to_many :clothes
  validates :name, presence: true
  validates :hex, presence: true
end
