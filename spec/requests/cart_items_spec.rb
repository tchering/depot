require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe "/cart_items", type: :request do

  # This should return the minimal set of attributes required to create a valid
  # CartItem. As you add validations to CartItem, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  describe "GET /index" do
    it "renders a successful response" do
      CartItem.create! valid_attributes
      get cart_items_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      cart_item = CartItem.create! valid_attributes
      get cart_item_url(cart_item)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_cart_item_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "renders a successful response" do
      cart_item = CartItem.create! valid_attributes
      get edit_cart_item_url(cart_item)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new CartItem" do
        expect {
          post cart_items_url, params: { cart_item: valid_attributes }
        }.to change(CartItem, :count).by(1)
      end

      it "redirects to the created cart_item" do
        post cart_items_url, params: { cart_item: valid_attributes }
        expect(response).to redirect_to(cart_item_url(CartItem.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new CartItem" do
        expect {
          post cart_items_url, params: { cart_item: invalid_attributes }
        }.to change(CartItem, :count).by(0)
      end

      it "renders a response with 422 status (i.e. to display the 'new' template)" do
        post cart_items_url, params: { cart_item: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested cart_item" do
        cart_item = CartItem.create! valid_attributes
        patch cart_item_url(cart_item), params: { cart_item: new_attributes }
        cart_item.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the cart_item" do
        cart_item = CartItem.create! valid_attributes
        patch cart_item_url(cart_item), params: { cart_item: new_attributes }
        cart_item.reload
        expect(response).to redirect_to(cart_item_url(cart_item))
      end
    end

    context "with invalid parameters" do
      it "renders a response with 422 status (i.e. to display the 'edit' template)" do
        cart_item = CartItem.create! valid_attributes
        patch cart_item_url(cart_item), params: { cart_item: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested cart_item" do
      cart_item = CartItem.create! valid_attributes
      expect {
        delete cart_item_url(cart_item)
      }.to change(CartItem, :count).by(-1)
    end

    it "redirects to the cart_items list" do
      cart_item = CartItem.create! valid_attributes
      delete cart_item_url(cart_item)
      expect(response).to redirect_to(cart_items_url)
    end
  end
end
