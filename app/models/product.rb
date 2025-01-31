class Product < ApplicationRecord
  validates :title, uniqueness: true
  validates :description, presence: true, length: { minimum: 5, maximum: 500, message: "should be between 5 and 500 characters" }
  validates :image_url, presence: true, allow_blank: true, format: {
                          with: %r{\.(gif|jpg|png)\Z}i,
                          message: "must be a URL for GIF, JPG or PNG image.",
                        }
  validates :price, numericality: { greater_than_or_equal_to: 0.01, message: "must be at least 0.01" }

  has_many :cart_items, dependent: :destroy
  before_destroy :ensure_not_referenced_by_any_cart_item

  private

  def ensure_not_referenced_by_any_cart_item
    unless cart_items.empty?
      errors.add(:base, "Items are still in cart. Remove them first.")
      throw :abort
    end
  end

  #:base is a special key used in Rails' errors object to add errors that apply to the entire object, rather than to a specific attribute.In this casse Product.
end

# Here we declare that a product has many cart_items and define a hook method named ensure_not_referenced_by_any_cart_item that is called before the destroy action.
#! A hook method(call back) is a method whose name starts with "before_" and is called before a specific action.
