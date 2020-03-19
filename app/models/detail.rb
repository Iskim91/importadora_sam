class Detail < ApplicationRecord
  belongs_to :clothe
  has_one_attached :photo
end
