class CartItemsController < ApplicationController
  include CurrentCart
  before_action :set_cart, only: [:create] #is in current_cart.rb
  #creates cart and store in session .
  before_action :set_cart_item, only: %i[ show edit update destroy ]

  # GET /cart_items or /cart_items.json
  def index
    @cart_items = CartItem.all
  end

  # GET /cart_items/1 or /cart_items/1.json
  def show
  end

  # GET /cart_items/new
  def new
    @cart_item = CartItem.new
  end

  # GET /cart_items/1/edit
  def edit
  end

  # POST /cart_items or /cart_items.json
  def create
    product = Product.find(params[:product_id])
    #received from params in store/index.html.erb button add to cart
    @cart_item = @cart.cart_items.build(product: product)
    #here @cart is extracted from concern current_cart

    respond_to do |format|
      if @cart_item.save
        format.html { redirect_to cart_path(@cart_item.cart), notice: "Cart item was successfully created." }
        # format.html { redirect_to cart_path(@cart), notice: "Cart item was successfully created." }
        #to in the above commented line (@cart) is directly received from set_cart method and above cart id is received from association in cart_items.rb
        format.json { render :show, status: :created, location: @cart_item }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @cart_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cart_items/1 or /cart_items/1.json
  def update
    respond_to do |format|
      if @cart_item.update(cart_item_params)
        format.html { redirect_to @cart_item, notice: "Cart item was successfully updated." }
        format.json { render :show, status: :ok, location: @cart_item }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @cart_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cart_items/1 or /cart_items/1.json
  def destroy
    @cart_item.destroy!

    respond_to do |format|
      format.html { redirect_to cart_items_path, status: :see_other, notice: "Cart item was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_cart_item
    @cart_item = CartItem.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def cart_item_params
    params.require(:cart_item).permit(:product_id, :cart_id)
  end
end
