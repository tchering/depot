class CartItem < ApplicationRecord
  belongs_to :product
  belongs_to :cart
end

# creating cart items instance with association method in rails console
# product = Product.first
# cart = Cart.first
# cart_item = cart.cart_items.new(product: product)
# cart_item.save()
