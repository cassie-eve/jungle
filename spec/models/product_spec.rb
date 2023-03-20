require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it "able to save with all required fields" do
      @category = Category.new(name: "Purple")
      @product = Product.new(name: "Plant", price: 4200, quantity: 5, category: @category)
      @product.save
      expect(@product).to be_valid
    end
    it "product name exists" do
      @category = Category.new(name: "Purple")
      @product = Product.new(price: 4200, quantity: 5, category: @category)
      @product.save
      expect(@product.errors.full_messages).to include("Name can't be blank")
    end
    it "has a price associated" do
      @category = Category.new(name: "Purple")
      @product = Product.new(name: "Plant", quantity: 5, category: @category)
      @product.save
      expect(@product.errors.full_messages).to include("Price can't be blank")
    end
    it "has a quantity" do
      @category = Category.new(name: "Purple")
      @product = Product.new(name: "Plant", price: 4200, category: @category)
      @product.save
      expect(@product.errors.full_messages).to include("Quantity can't be blank")
    end
    it "has an category" do
      @category = Category.new(name: "Purple")
      @product = Product.new(name: "Plant", price: 4200, quantity: 5)
      @product.save
      expect(@product.errors.full_messages).to include("Category can't be blank")
    end
  end
end
