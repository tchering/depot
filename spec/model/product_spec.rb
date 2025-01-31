require "rails_helper"

RSpec.describe Product, type: :model do
  it "is valid with product attributes" do
    product = Product.create(title: "hello", description: "testing product creation", image_url: "ridocker.jpg", price: "19.19")
    expect(product).to be_valid
  end

  it "is invalid with duplicate title" do
    Product.create(title: "hello", description: "testing product creation", image_url: "", price: "19.19")
    product = Product.new(title: "hello", description: "another product", image_url: "", price: "19.19")
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

  it "image url should contain the extension" do
    product = Product.create!(
      title: "Original Book",
      description: "Initial description",
      image_url: "cover.jpg",
      price: 29.99,
    )
    expect(product.image_url).to match(/\.(jpg|png|gif)\z/i)
  end

  it " should not be valid with missing extension for image url" do
    product = Product.new(
      title: "Original Book",
      description: "Initial description",
      image_url: "cover",
      price: 29.99,
    )
    expect(product).not_to be_valid
    expect(product.errors[:image_url]).to include("must be a URL for GIF, JPG or PNG image.")
  end

  it "should not be valid description with min length of 5 and max length of 255" do
    product = Product.new(
      title: "hello",
      description: "a",
      image_url: "cover.jpg",
      price: 29.99,
    )
    expect(product).not_to be_valid
    expect(product.errors[:description]).to include("should be between 5 and 500 characters")
  end
end
