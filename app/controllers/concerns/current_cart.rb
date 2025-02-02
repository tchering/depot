module CurrentCart
  extend ActiveSupport::Concern

  included do
    before_action :set_cart       # Runs set_cart before controller actions
    helper_method :current_cart    # Makes current_cart available in views
  end

  private

  def set_cart
    @cart = Cart.find(session[:cart_id])
  rescue ActiveRecord::RecordNotFound
    @cart = Cart.create
    session[:cart_id] = @cart.id
  end

  def current_cart
    @cart = Cart.find(session[:cart_id])
  rescue ActiveRecord::RecordNotFound
    @cart = Cart.create
    session[:cart_id] = @cart.id
  end
end

# The set
# _
# cart method starts by getting the :cart
# _
# id from the session object and then
# attempts to find a cart corresponding to this ID. If such a cart record isn’t found
# (which will happen if the ID is nil or invalid for any reason), this method will
# proceed to create a new Cart and then store the ID of the created cart into the
# session.
# Note that we place the set
# _
# cart method in a CurrentCart module and place that
# module in a new file in the app/controllers/concerns directory.
# [47] This treatment allows
# us to share common code (even as little as a single method!) among controllers.
# Additionally, we mark the method as private, which prevents Rails from ever
# making it available as an action on the controller.
