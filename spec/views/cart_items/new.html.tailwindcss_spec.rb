require 'rails_helper'

RSpec.describe "cart_items/new", type: :view do
  before(:each) do
    assign(:cart_item, CartItem.new(
      product: nil,
      cart: nil
    ))
  end

  it "renders new cart_item form" do
    render

    assert_select "form[action=?][method=?]", cart_items_path, "post" do

      assert_select "input[name=?]", "cart_item[product_id]"

      assert_select "input[name=?]", "cart_item[cart_id]"
    end
  end
end
