class Cart < ApplicationRecord
  has_many :cart_items, dependent: :destroy
  has_many :products, through: :cart_items

  def add_product(product)
    current_item = cart_items.find_by(product_id: product.id)
    if current_item
      current_item.quantity += 1
    else
      current_item = cart_items.build(product_id: product.id, quantity: 1)
    end
    current_item
  end

  def total_items
    cart_items.sum(:quantity)
  end

  def total_price
    cart_items.sum { |product| product.total_price }
    # here we called total_price method defined in cart_item.rb becuase they are connected with associations. We can also call any method defined in product.rb
  end
end
