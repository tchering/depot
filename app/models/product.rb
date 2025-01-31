class Product < ApplicationRecord
  validates :title, uniqueness: true
  validates :description, presence: true, length: { minimum: 5, maximum: 500, message: "should be between 5 and 500 characters" }
  validates :image_url, presence: true, allow_blank: true, format: {
                          with: %r{\.(gif|jpg|png)\Z}i,
                          message: "must be a URL for GIF, JPG or PNG image.",
                        }
  validates :price, numericality: { greater_than_or_equal_to: 0.01, message: "must be at least 0.01" }
end
