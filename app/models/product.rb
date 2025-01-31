class Product < ApplicationRecord
  validates :image_url, presence: true
end
