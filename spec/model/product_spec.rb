require "rails_helper"

RSpec.describe Product, type: :model do
  it "is valid with product attributes" do
    product = Product.create(title: "hello", description: "testing product creation", image_url: "ridocker.jpg", price: "19.19")
    expect(product).to be_valid
  end

  it "is invalid with missing attributes" do
    product = Product.create(title: "hello", description: "testing product creation", image_url: "",
                             price: "19.19")
    expect(product).not_to be_valid
  end

  it "user can edit the product" do
    product = Product.create!(
      title: "Original Book",
      description: "Initial description",
      image_url: "cover.jpg",
      price: 29.99,
    )
    product.update(title: "New book", description: "updated book", price: "19.99")
    expect(product.title).to eq("New book")
    expect(product.description).to eq("updated book")
  end

  it "should delete the products" do
    product = Product.create!(
      title: "Original Book",
      description: "Initial description",
      image_url: "cover.jpg",
      price: 29.99,
    )
    product.destroy
    expect(Product.find_by(id: product.id)).to be_nil
  end
end
