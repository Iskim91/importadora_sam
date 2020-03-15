class ClothesColor < ApplicationRecord
  belongs_to :clothe
  belongs_to :color
  validates :clothe, uniqueness: { scope: :color }

end
